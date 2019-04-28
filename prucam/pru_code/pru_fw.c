#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <pru_cfg.h>
#include <pru_intc.h>
#include "resource_table_empty.h"
#include <pru_ctrl.h>
#define DELAY 100000000
#define MASK_16_24 0x1FF0000
#define SHARED 0x00010000 //offset of PRU shared mem
#define ROWS 960  //rows per image
#define COLS 1280 //pixels per row
#define CELLS COLS/4 //a cell is a 32 bit word hold 4 byte sized pixels //320

//PRU R31 bit masks
#define CLK 0x00010000
#define VSYNC 0x00008000
#define HSYNC 0x00004000
#define BIT31 0x80000000


/*
 * TODO
 * - other PRU does data transfer AND acts as watchdog for other?
 */

volatile register uint32_t __R30;
volatile register uint32_t __R31;
void initPRU();

void main(void)
{
  //init PRU registers
  initPRU();

  /* To capture an image, the kernel allocates a hunk of memory, writes the
   * physicial address of this allocation to a known location in the PRU shared
   * RAM, and then manually triggers a PRU system event. The PRU detects this
   * event, reads the memory location, reads in the image data and writes it to
   * the memory location, and finally triggers an interrupt which tells the
   * kernel driver that it is done 
   */

  //manually trigger r31:31 set bit 24 in PRU SRSR0 to trigger event 24
  //CT_INTC.SRSR0_bit.RAW_STS_31_0 = 0x1000000; 

  volatile int* base; //base address for the actual image transfer
  int line;
  int col;

  //WTF this should only have to be COLS, but when I make it that size, parts
  //get overwritten by something else. However, if I malloc that same amount it
  //works fine. TODO when I figure out how to exit this loop, free this memory
  //char buf[COLS*2];
  char* buf;
  buf = malloc(COLS);

  while(1)
  {
    //without this delay somewhere in this section, blacks frames are often
    //returned! I don't know why this is.
    __delay_cycles(1);

    //wait for signal from ARM, R31 bit 31 will go high
    while((__R31 & BIT31) == 0 );

    //clear all system events
    CT_INTC.SECR0_bit.ENA_STS_31_0 = 0xFFFFFFFF;

    // The kernel will write the address of the allocated memory location into
    // a known shared memory location. Here we read that address from that
    // location.
    base = *(volatile int**)SHARED; 

    while(__R31 & VSYNC); //wait for VSYNC to go low
    while((__R31 & VSYNC) == 0); //wait for VSYNC to go high

    for(line = 0 ; line < ROWS ; line++)
    {
      while((__R31 & HSYNC) == 0); //wait for HSYNC to go high

      //loop through every pixel in row
      for(col = 0 ; col < COLS ; col++)
      {
        while(__R31 & CLK); //wait for R31[16] to go low 
        while((__R31 & CLK) == 0); //wait for R31[16] to go high

        //write LSB value from GPIO(R31) to buf
        buf[col] = __R31; //TODO should increment here instead
      }

      //transfer line to memory
      memcpy(base, buf, COLS);

      //offset base address
      base += CELLS;
    }

    //trigger interrupt to tell kernel transfer is complete
    __R31 = 0x24; //trigger INTC 20
  }
}

void initPRU() {
  // Clear SYSCFG[STANDBY_INIT] to enable OCP master port
  // This is supposed to allow us to write to the global memory space?
  // it works without this, sooo....
  CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

  //Apparently there is no difference when parallel capture is used!?!?!
  //Parallel Capture Settings
  CT_CFG.GPCFG0_bit.PRU0_GPI_MODE = 0x01; //enable parallel capture
  CT_CFG.GPCFG0_bit.PRU0_GPI_CLK_MODE = 0x01; //capture on positive edge

  //CT_CFG.GPCFG0_bit.PRU0_GPI_MODE = 0x00; //GPIO direct mode(default)


  //====PRU INTC SETUP====
  // map sys events 16-23 --> channels 2-9 --> host 2-9
  //TABLE 4-11, PG 212

  //CT_INTC.SIPR0_bit.POLARITY_31_0 = MASK_16_23; //set 16-23 to active high
  CT_INTC.SIPR0_bit.POLARITY_31_0 = MASK_16_24; //set 16-24 to active high
  CT_INTC.SITR0_bit.TYPE_31_0 = 0x00; //set all to pulse type interrupt //MAYBE PLAY WITH THIS?

  //map events to channels to hosts
  /* Something is broken here. No matter what I try, sys events 20-23 will ONLY
   * map to INTC 20-23, while the below mapping says 16-19 should map to INTC
   * 20-23. This makes NO sense according to the documentation. Furthermore,
   * I seem to only be able to get INTC 20-23 to trigger, regardless of what
   * events I trigger(I tried SRSR reg). The mappings seem to have almost no
   * effect. Come back to this.
   */
  //sys events to channels
  CT_INTC.CMR4_bit.CH_MAP_16 = 2; //sys evt 16 --> chan 2
  CT_INTC.CMR4_bit.CH_MAP_17 = 3; //sys evt 17 --> chan 3
  CT_INTC.CMR4_bit.CH_MAP_18 = 4; //sys evt 18 --> chan 4
  CT_INTC.CMR4_bit.CH_MAP_19 = 5; //sys evt 19 --> chan 5
  CT_INTC.CMR5_bit.CH_MAP_20 = 6; //sys evt 20 --> chan 6
  CT_INTC.CMR5_bit.CH_MAP_21 = 7; //sys evt 21 --> chan 7
  CT_INTC.CMR5_bit.CH_MAP_22 = 8; //sys evt 22 --> chan 8
  CT_INTC.CMR5_bit.CH_MAP_23 = 9; //sys evt 23 --> chan 9
  CT_INTC.CMR6_bit.CH_MAP_24 = 1; //sys evt 24 --> chan 1 for the host to interrupt the PRU

  //channels to host
  CT_INTC.HMR0_bit.HINT_MAP_1 = 1; //chan 1 --> host 1 for the host to interrupt the PRU 
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
  //CT_INTC.HIER_bit.EN_HINT = 0x3FC;

  //enable host interrupts 1-9
  CT_INTC.HIER_bit.EN_HINT = 0x3FE;

  //enable system events 16-24
  CT_INTC.ESR0_bit.EN_SET_31_0 = MASK_16_24;

  //enable global interrupts
  CT_INTC.GER_bit.EN_HINT_ANY = 0x01; 

  //====END PRU INTC CONFIG====
  /*
     __R31 = 0x24; //trigger INTC 20
     __R31 = 0x25; //trigger INTC 21
     __R31 = 0x26; //trigger INTC 22
     __R31 = 0x27; //trigger INTC 23
     */

}
