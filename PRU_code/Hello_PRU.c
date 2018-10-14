#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <pru_cfg.h>
#include "resource_table_empty.h"
#include <pru_ctrl.h>

#define DELAY 100000000

#define MEMLOC 0xa0000000
#define ARM_2_PRU 0x00000001
#define PRU_2_ARM 0x00000002
//#define mem_loc *(volatile unsigned int *) 0xa0000000

volatile register uint32_t __R30;
volatile register uint32_t __R31;

void main(void)
{
	volatile uint32_t pru0_0 = 0x0001; //D1 Blue
	volatile uint32_t pru0_1 = 0x0002; //D2 Green
	volatile uint32_t pru0_2 = 0x0004;
	volatile uint32_t pru0_3 = 0x0008;
	volatile uint32_t pru0_5 = 0x0020;

	// Clear SYSCFG[STANDBY_INIT] to enable OCP master port
	// This is supposed to allow us to write to the global memory space?
	// it works without this, but....
	CT_CFG.SYSCFG_bit.STANDBY_INIT = 0;

	volatile uint32_t *ptr;
	ptr = (volatile unsigned int *)MEMLOC;

	//Flash the LED a few times at startup
	int i = 0;
	for(i ; i < 4 ; i++)
	{
		__R30 |= pru0_2;
		__delay_cycles(DELAY/4);
		__R30 &= ~pru0_2;
		__delay_cycles(DELAY/7);
	}

	//zero status registers
	*ptr &= ~ARM_2_PRU;
	*ptr &= ~PRU_2_ARM;


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
