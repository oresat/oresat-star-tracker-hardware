#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <pru_cfg.h>
#include "resource_table_empty.h"
#include <pru_ctrl.h>

#define DELAY 100000000

#define MEMLOC 0xa0000000
#define SIZE 32
#define ARM_2_PRU 0x00000001
#define PRU_2_ARM 0x00000002
#define STATUS 0xFF //status reg offset set

void flash(char led);
void dance();

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
	// it works without this, but....
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

	int *ptr;
	ptr = (int *)MEMLOC;

	//Flash the LEDs a few times at startup
	dance();

	while(1)
	{

		//zero status registers
		*ptr &= ~ARM_2_PRU;
		*ptr &= ~PRU_2_ARM;

		while((*ptr & ARM_2_PRU) == 0) //wait for signal
			flash(0);

		int *addr = ptr + STATUS;
		int j = 0;

		/*
		*(addr + (0 * (int)0xff)) = 0xff;
		*(addr + (1 * (int)0xff)) = 0xff;
		*(addr + (2 * (int)0xff)) = 0xff;
		*(addr + (3 * (int)0xff)) = 0xff;
		*(addr + (4 * (int)0xff)) = 0xff;
		*(addr + (5 * (int)0xff)) = 0xff;
		*(addr + (6 * (int)0xff)) = 0xff;
		*(addr + (7 * (int)0xff)) = 0xff;
		*/
		
		for(j ; j < SIZE ; j++)
		{
			//char temp = j;
			char temp = j;
			*addr = temp;
			addr++;
		}

		//send finished flag
		*ptr |= PRU_2_ARM;

		//victory dance!
		flash(2);
	}

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
	 */
}


//flash the specified LED
void flash(char led)
{
	if (led > 3)
		led = 3;
	int i = 0;
	for(i ; i < 4 ; i++)
	{
		__R30 |= LED[led];
		__delay_cycles(DELAY/10);
		__R30 &= ~LED[led];
		__delay_cycles(DELAY/10);
	}
}

void dance()
{
	flash(0);
	flash(1);
	flash(2);
	flash(3);
}

/*
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



