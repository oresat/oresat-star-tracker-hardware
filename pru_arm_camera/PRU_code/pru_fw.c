#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <pru_cfg.h>
#include <pru_intc.h>
#include "resource_table_empty.h"
#include <pru_ctrl.h>
#define DELAY 100000000
#define MASK_16_23 0xFF0000

//#define MEMLOC 0xa0000000
#define SHARED 0x00010000
#define SIZE 1000
#define ARM_2_PRU 0x00000001
#define PRU_2_ARM 0x00000002
#define END	  0x08
#define BUF 0x00000004
//#define PRU_BASE_ADDR 0x4a300000
//#define PRU_BASE_ADDR 0x00000000
//#define PRU_BASE_ADDR 0x90000000
#define PRU_BASE_ADDR 0x9c800000
#define STATUS 0x1000
#define STATUS_MEM (PRU_BASE_ADDR + STATUS)
#define BUF0  (PRU_BASE_ADDR + 0x00002000)
#define BUF1  (PRU_BASE_ADDR + 0x00003000)
#define key 0x1234

#define ROWS 960  //rows per image
#define COLS 1280 //pixels per row
#define CELLS COLS/4 //a cell is a 32 bit word hold 4 byte sized pixels //320

#define VSYNC 0x00008000
#define HSYNC 0x00004000

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

  //Apparently there is no difference when parallel capture is used!?!?!
  //Parallel Capture Settings
  //CT_CFG.GPCFG0_bit.PRU0_GPI_MODE = 0x01; //enable parallel capture
  //CT_CFG.GPCFG0_bit.PRU0_GPI_CLK_MODE = 0x01; //capture on positive edge

  CT_CFG.GPCFG0_bit.PRU0_GPI_MODE = 0x00; //GPIO direct mode(default)


  //====PRU INTC SETUP====
  // map sys events 16-23 --> channels 2-9 --> host 2-9
  //TABLE 4-11, PG 212

  CT_INTC.SIPR0_bit.POLARITY_31_0 = MASK_16_23; //set 16-23 to active high
  CT_INTC.SITR0_bit.TYPE_31_0 = 0x00; //set all to pulse type interrupt //MAYBE PLAY WITH THIS?
  
  //map events to channels to hosts
  /* Something is broken here. No matter what I try, sys events 20-23 will ONLY
   * map to INTC 20-23, whil the below mapping says 16-19 should map to INTC
   * 20-23. This makes NO sense according to the documentation. Furthermore,
   * I seem to only be able to get INTC 20-23 to trigger, regardless of what
   * events I trigger(I tried SRSR reg). The mappings seem to have almost no
   * effect. Come back to this.
   */
  CT_INTC.CMR4_bit.CH_MAP_16 = 2; //sys evt 16 --> chan 2
  CT_INTC.CMR4_bit.CH_MAP_17 = 3; //sys evt 17 --> chan 3
  CT_INTC.CMR4_bit.CH_MAP_18 = 4; //sys evt 18 --> chan 4
  CT_INTC.CMR4_bit.CH_MAP_19 = 5; //sys evt 19 --> chan 5
  CT_INTC.CMR5_bit.CH_MAP_20 = 6; //sys evt 20 --> chan 6
  CT_INTC.CMR5_bit.CH_MAP_21 = 7; //sys evt 21 --> chan 7
  CT_INTC.CMR5_bit.CH_MAP_22 = 8; //sys evt 22 --> chan 8
  CT_INTC.CMR5_bit.CH_MAP_23 = 9; //sys evt 23 --> chan 9
  CT_INTC.HMR0_bit.HINT_MAP_2 = 2; //chan 2 --> host 2
  CT_INTC.HMR0_bit.HINT_MAP_3 = 3; //chan 3 --> host 3
  CT_INTC.HMR1_bit.HINT_MAP_4 = 4; //chan 4 --> host 4
  CT_INTC.HMR1_bit.HINT_MAP_5 = 5; //chan 5 --> host 5
  CT_INTC.HMR1_bit.HINT_MAP_6 = 6; //chan 6 --> host 6
  CT_INTC.HMR1_bit.HINT_MAP_7 = 7; //chan 7 --> host 7
  CT_INTC.HMR2_bit.HINT_MAP_8 = 8; //chan 8 --> host 8
  CT_INTC.HMR2_bit.HINT_MAP_9 = 9; //chan 9 --> host 9
  
  //clear all system events
  CT_INTC.SECR0_bit.ENA_STS_31_0 = 0xFFFFFFFF;
  CT_INTC.SECR1_bit.ENA_STS_63_32 = 0xFFFFFFFF;

  //enable host interrupts 2-9
  CT_INTC.HIER_bit.EN_HINT = 0x3FC;

  //enable system events 16-23
  CT_INTC.ESR0_bit.EN_SET_31_0 = MASK_16_23;

  //enable global interrupts
  CT_INTC.GER_bit.EN_HINT_ANY = 0x01; 

  //====END PRU INTC CONFIG====

  /*
  __R31 = 0x24; //trigger INTC 20
  __R31 = 0x25; //trigger INTC 21
  __R31 = 0x26; //trigger INTC 22
  __R31 = 0x27; //trigger INTC 23
  */
  
  //approx 1 second delay
  //volatile int i;
  //for(i = 0 ; i < 10000000 ; i++);


  /*
   * Basic handshake with kernel driver. Kernel driver allocated memory region.
   * It writes the address to a shared location known to both the PRU and the
   * kernel. The PRU reads that location, adds a shared key, and writes it back
   * to the next memory location. The kernel then reads this value, adds the
   * key again, and finally writes it back to the next memory location. After
   * this last step the PRU exits this loop.
   */
  volatile int* shared; //location of PRU shared memory
  volatile int *pru_write_back; //location where PRU writes back to kernel
  volatile int *kernel_write_back; //location where kernel writes back to PRU 
  int shareRead; //value read from location, which will be base address if handshake successful
  int writeBack; //value to writeback to ARM and check against response
  int* base; //base address for the actual image transfer
  shared = (volatile int*)SHARED;   
  pru_write_back = shared + 1; 
  kernel_write_back = pru_write_back + 1; 
  *kernel_write_back = 0x00; //zero the kernel writeback to verify new value
  
  while(1)
  {
    shareRead = *shared; //read value in shared memory

    writeBack = shareRead + key; //add key to value

    *pru_write_back = writeBack; //write back value with key to new location

    //after writing, PRU verifys another value read from the kernel
    writeBack += key; //add key to value

    //TODO should this be a loop to run a certain amount of times  
    //read value and break if the kernel responded successfully
    if(*kernel_write_back == writeBack)
    {
      base = (int*)shareRead;
      break;
    }
  }

  //write back some sequential values to ensure it's working
  volatile int i;
  for(i = 0 ; i < 256 ; i++)
  {
    *base = i;
    base++;
  }

  //signal done
  __R31 = 0x24; //trigger INTC 20

  while(1);

  int *buf0 = (int *)BUF0;
  int *buf1 = (int *)BUF1;

  /*
   * status is used to recieve signals from ARM. Status will be the base address
   * we recieved in the handshake
  */
  int *status;
  status = (int*)base;

  //zero status flags
  *status &= ~ARM_2_PRU;
  *status &= ~PRU_2_ARM;
  *status &= ~END;

  int addr;

  //holds to current buffer to write to
  int curBuf = 0;

  int writeReg = 0x00;
  int line;

  //point it to the PRU shared RAM
  //int *temp = (int *)SHARED;
  int temp[COLS]; //TODO feel like this only needs to be CELLS ?
  int pos = 0;
  while(1)
  {
    //wait for signal
    while((*status & ARM_2_PRU) < 1) //TODO: need a timeout here 
      __delay_cycles(1); //delay is needed between checking memory??? TODO: Use interupts!
    //Minimum needed delay is just 1. However, more delay give the linux side time to access memory?

    //clear the flag
    *status &= ~ARM_2_PRU;

    //__R30 |= 0x8000; //set gpio 15
    while((__R31 & VSYNC) > 0); //wait for VSYNC to go low

    while((__R31 & VSYNC) == 0); //while VSYNC is high //used to contain below within this loop, not sure which is better. TODO test!
    //__R30 |= 0x8000; //set gpio 15

    //TODO should I loop through the number of lines here?
    for(line = 0 ; (line < ROWS) ; line++)
      //while((__R31 & VSYNC) > 0) //wait for VSYNC to go low
    {
      pos = 0;
      if(!curBuf) //if on buf0
      {
        //loop through every word in buffer
        for(addr = 0 ; addr < CELLS ; ++addr)
        {
          //TODO use macro when waiting for clock
          //not using for loop here for speed!
          while((__R31 & HSYNC) == 0); //wait for HSYNC to go high

          while(__R31 & 0x00010000); //wait for R31[16] to go low 
          while((__R31 & 0x00010000) == 0); //wait for R31[16] to go high
          writeReg = (__R31 & 0x000000ff) << 24; //I am assigning here instead of ORing in order to clear writeReg
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff) << 16; 
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff) << 8; 
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff); 
          //*addr = writeReg; //write to memory
          temp[pos++] = writeReg;
        }
        memcpy(buf0, temp, COLS);
        curBuf = 1; //switch buffer
        *status &= ~BUF; //clear buf flag for buf 0
      }else{
        //loop through every word in buffer
        for(addr = 0 ; addr < CELLS ; ++addr)
        {
          //not using for loop here for speed!
          while((__R31 & HSYNC) == 0); //wait for HSYNC to go high

          while(__R31 & 0x00010000); //wait for R31[16] to go low 
          while((__R31 & 0x00010000) == 0); //wait for R31[16] to go high
          writeReg = (__R31 & 0x000000ff) << 24; //I am assigning here instead of ORing in order to clear writeReg
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff) << 16; 
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff) << 8; 
          while(__R31 & 0x00010000); 
          while((__R31 & 0x00010000) == 0); 
          writeReg |= (__R31 & 0x000000ff); 

          //*addr = writeReg; //write to memory
          temp[pos++] = writeReg;
        }
        memcpy(buf1, temp, COLS);
        memcpy(buf1+(CELLS/2), temp + (CELLS/2), COLS/2);
        curBuf = 0; //switch buffer
        *status |= BUF; //set buf flag for buf1
      }
      //send finished flag to ARM
      *status |= PRU_2_ARM;
    }

    //	__R30 &= ~0x8000; //unset gpio 15

    *status |= END;

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

