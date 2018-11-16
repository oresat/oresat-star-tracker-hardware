#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <pru_cfg.h>
#include "resource_table_empty.h"
#include <pru_ctrl.h>

#define DELAY 100000000

//#define MEMLOC 0xa0000000
#define SIZE 1000
#define ARM_2_PRU 0x00000001
#define PRU_2_ARM 0x00000002
//#define PRU_BASE_ADDR 0x4a300000
//#define PRU_BASE_ADDR 0x00000000
#define PRU_BASE_ADDR 0x80000000
#define PRU0_RAM 0x00010000
#define STATUS 0x1000
#define MEMLOC (PRU_BASE_ADDR + PRU0_RAM)
#define STATUS_MEM (PRU_BASE_ADDR + STATUS)

void flash(char led);
void dance();
void clear();

volatile register uint32_t __R30;
volatile register uint32_t __R31;

volatile uint32_t LED[] = {
	0x0001, //D1 Blue
	0x0002, //D2 Green
	0x0004, //D3 Orange
	0x0008  //D4 Red
};

void main(void)
{

	// Clear SYSCFG[STANDBY_INIT] to enable OCP master port
	// This is supposed to allow us to write to the global memory space?
	// it works without this, sooo....
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;


	/*
	while(1)
	{
 		__R30 ^= LED[2];
		__delay_cycles(500000000);
	}
	*/
	volatile int *ptr;
	ptr = (volatile int *)MEMLOC;

	//Flash the LEDs a few times at startup
	dance();
	clear();

	//zero status registers
	*ptr &= ~ARM_2_PRU;
	*ptr &= ~PRU_2_ARM;
	int count = 0; //making this volatile slows it down alot!!
	volatile int *startAddr;
	startAddr = ptr;
	volatile int *addr;

	int *status;
	status = (int*)STATUS_MEM;

	//HOLY COW, casting ptr to int increased speed x4 !!!!
	int *max = (int*)ptr + (SIZE); //making this volatile slows it down alot!!
	while(1)
	{
		//wait for signal
		while((*status & ARM_2_PRU) < 1) //TODO: need a timeout here 
			__delay_cycles(1); //delay is needed between checking memory???
			//Minimum neede delay is  just 1. However, more delay give the linux side time to access memory?

		//clear the flag
		*status &= ~ARM_2_PRU;
		
		//set starting address
		addr = startAddr;

		//don't understand why I need the +1?? It doesn't work if I add it above?
		for(; addr < max ; ++addr)
			*addr = ++count;
		
		//send finished flag
		*status |= PRU_2_ARM;
	}
}

//clear all LEDs
void clear()
{
	int i = 0;
	for(; i < 4 ; i++)
		__R30 &= ~LED[i];
}

//flash the specified LED
void flash(char led)
{
	if (led > 3)
		led = 3;
	int i = 0;
	for(; i < 4 ; i++)
	{
		__R30 |= LED[led];
		__delay_cycles(DELAY/50);
		__R30 &= ~LED[led];
		__delay_cycles(DELAY/50);
	}
}

//flash all LEDs
void dance()
{
	flash(0);
	flash(1);
	flash(2);
	flash(3);
}

//Where code goes to die

/*

   while(1) 
   {
   if((*ptr & ARM_2_PRU) == 1) {
   __R30 |= pru0_0;
   __delay_cycles(DELAY);
 *ptr &= ~ARM_2_PRU; //clear the flag
 __R30 &= ~pru0_0;

//send response
 *ptr |= PRU_2_ARM;
 }else{
 __R30 ^= pru0_1;
 __delay_cycles(DELAY/10);
 }
 }

 while (1) {

 if(!(__R31 & pru0_5))
 {
 __R30 ^= pru0_0;
 __delay_cycles(DELAY);
 __R30 ^= pru0_1;
 __delay_cycles(DELAY);
 __R30 ^= pru0_2;
 __delay_cycles(DELAY);
 __R30 ^= pru0_3;
 __delay_cycles(DELAY);
 }else{
 __R30 = 0x0000;

 __R30 ^= 0x0020;
 __delay_cycles(DELAY);
 __R30 ^= 0x0010;
 __delay_cycles(DELAY);
 __R30 ^= 0x0008;
 __delay_cycles(DELAY);
 }
 }*/



