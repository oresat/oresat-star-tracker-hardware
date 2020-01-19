/*
 * ===== regs.h =====
 * Define all sets of constant register sets here i.e.
 * startup register, sleep registers, etc.
 */


#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>


camReg startupRegs[] = {
  // from AR0130REV1.ini in ON Semi software suite, 
  // "[AR0130 Rev1 DCDS sequencer load 5-07-2013 300 pixclks]"
  {.reg = 0x3088, .val = 0x8000}, 
  {.reg = 0x3086, .val = 0x0225}, 
  {.reg = 0x3086, .val = 0x5050}, 
  {.reg = 0x3086, .val = 0x2D26}, 
  {.reg = 0x3086, .val = 0x0828}, 
  {.reg = 0x3086, .val = 0x0D17}, 
  {.reg = 0x3086, .val = 0x0926}, 
  {.reg = 0x3086, .val = 0x0028}, 
  {.reg = 0x3086, .val = 0x0526}, 
  {.reg = 0x3086, .val = 0xA728}, 
  {.reg = 0x3086, .val = 0x0725}, 
  {.reg = 0x3086, .val = 0x8080}, 
  {.reg = 0x3086, .val = 0x2917}, 
  {.reg = 0x3086, .val = 0x0525}, 
  {.reg = 0x3086, .val = 0x0040}, 
  {.reg = 0x3086, .val = 0x2702}, 
  {.reg = 0x3086, .val = 0x1616}, 
  {.reg = 0x3086, .val = 0x2706}, 
  {.reg = 0x3086, .val = 0x2117}, 
  {.reg = 0x3086, .val = 0x3626}, 
  {.reg = 0x3086, .val = 0xA717}, 
  {.reg = 0x3086, .val = 0x0326}, 
  {.reg = 0x3086, .val = 0xA717}, 
  {.reg = 0x3086, .val = 0x1F28}, 
  {.reg = 0x3086, .val = 0x051A}, 
  {.reg = 0x3086, .val = 0x174A}, 
  {.reg = 0x3086, .val = 0x26E7}, 
  {.reg = 0x3086, .val = 0x175A}, 
  {.reg = 0x3086, .val = 0x26E6}, 
  {.reg = 0x3086, .val = 0x1703}, 
  {.reg = 0x3086, .val = 0x26E4}, 
  {.reg = 0x3086, .val = 0x174B}, 
  {.reg = 0x3086, .val = 0x2700}, 
  {.reg = 0x3086, .val = 0x1710}, 
  {.reg = 0x3086, .val = 0x1D17}, 
  {.reg = 0x3086, .val = 0xFF17}, 
  {.reg = 0x3086, .val = 0x2026}, 
  {.reg = 0x3086, .val = 0x6017}, 
  {.reg = 0x3086, .val = 0x0125}, 
  {.reg = 0x3086, .val = 0x2020}, 
  {.reg = 0x3086, .val = 0x1721}, 
  {.reg = 0x3086, .val = 0x2500}, 
  {.reg = 0x3086, .val = 0x2021}, 
  {.reg = 0x3086, .val = 0x1710}, 
  {.reg = 0x3086, .val = 0x2805}, 
  {.reg = 0x3086, .val = 0x1B17}, 
  {.reg = 0x3086, .val = 0x0327}, 
  {.reg = 0x3086, .val = 0x0617}, 
  {.reg = 0x3086, .val = 0x0317}, 
  {.reg = 0x3086, .val = 0x4126}, 
  {.reg = 0x3086, .val = 0x6017}, 
  {.reg = 0x3086, .val = 0xAE25}, 
  {.reg = 0x3086, .val = 0x0090}, 
  {.reg = 0x3086, .val = 0x2700}, 
  {.reg = 0x3086, .val = 0x2618}, 
  {.reg = 0x3086, .val = 0x2800}, 
  {.reg = 0x3086, .val = 0x2E2A}, 
  {.reg = 0x3086, .val = 0x2808}, 
  {.reg = 0x3086, .val = 0x1E08}, 
  {.reg = 0x3086, .val = 0x3114}, 
  {.reg = 0x3086, .val = 0x4040}, 
  {.reg = 0x3086, .val = 0x1420}, 
  {.reg = 0x3086, .val = 0x2014}, 
  {.reg = 0x3086, .val = 0x1010}, 
  {.reg = 0x3086, .val = 0x3414}, 
  {.reg = 0x3086, .val = 0x0010}, 
  {.reg = 0x3086, .val = 0x1400}, 
  {.reg = 0x3086, .val = 0x2014}, 
  {.reg = 0x3086, .val = 0x0040}, 
  {.reg = 0x3086, .val = 0x1318}, 
  {.reg = 0x3086, .val = 0x0214}, 
  {.reg = 0x3086, .val = 0x7070}, 
  {.reg = 0x3086, .val = 0x0414}, 
  {.reg = 0x3086, .val = 0x7070}, 
  {.reg = 0x3086, .val = 0x0314}, 
  {.reg = 0x3086, .val = 0x7070}, 
  {.reg = 0x3086, .val = 0x1720}, 
  {.reg = 0x3086, .val = 0x0214}, 
  {.reg = 0x3086, .val = 0x0020}, 
  {.reg = 0x3086, .val = 0x0214}, 
  {.reg = 0x3086, .val = 0x0050}, 
  {.reg = 0x3086, .val = 0x0414}, 
  {.reg = 0x3086, .val = 0x0020}, 
  {.reg = 0x3086, .val = 0x0414}, 
  {.reg = 0x3086, .val = 0x0050}, 
  {.reg = 0x3086, .val = 0x2203}, 
  {.reg = 0x3086, .val = 0x1400}, 
  {.reg = 0x3086, .val = 0x2003}, 
  {.reg = 0x3086, .val = 0x1400}, 
  {.reg = 0x3086, .val = 0x502C}, 
  {.reg = 0x3086, .val = 0x2C2C}, 
  {.reg = 0x309E, .val = 0x0000}, //RESERVED
  {.reg = 0x30E4, .val = 0x6372}, //RESERVED
  {.reg = 0x30E2, .val = 0x7253}, //RESERVED
  {.reg = 0x30E0, .val = 0x5470}, //RESERVED
  {.reg = 0x30E6, .val = 0xC4CC}, //RESERVED
  {.reg = 0x30e8, .val = 0x8050}, //RESERVED

  // TODO not sure what this is for, look into that
  {.reg = 0x3082, .val = 0x0029}, //OP MODE CTL

  // from AR0130REV1.ini in ON Semi software suite, 
  // "[AR0130 Rev1 Optimized settings DCDS 5-7-2013]"
  {.reg = 0x301E, .val = 0x00C8}, // DATA_PEDESTAL
  {.reg = 0x3EDA, .val = 0x0F03}, // DAC_LD_14_15
  {.reg = 0x3EDE, .val = 0xC005}, // DAC_LD_18_19
  {.reg = 0x3ED8, .val = 0x09EF}, // DAC_LD_12_13
  {.reg = 0x3EE2, .val = 0xA46B}, // DAC_LD_22_23
  {.reg = 0x3EE0, .val = 0x057D}, // DAC_LD_20_21
  {.reg = 0x3EDC, .val = 0x0080}, // DAC_LD_16_17
  {.reg = 0x3044, .val = 0x0404}, // DARK_CONTROL
  {.reg = 0x3EE6, .val = 0x4303}, // DAC_LD_26_27
  {.reg = 0x3EE4, .val = 0xD208}, // DAC_LD_24_25
  {.reg = 0x3ED6, .val = 0x00BD}, // DAC_LD_10_11
  {.reg = 0x30B0, .val = 0x1300}, // DIGITAL_TEST
  {.reg = 0x30BA, .val = 0x0018},
  {.reg = 0x30D4, .val = 0xE007}, // COLUMN_CORRECTION

  // TODO pick up here, ini file line 449, looks like there is some reset stuff



  {.reg = 0x3012, .val = 0x00a0}, // COARSE_INTEGRATION_TIME
  {.reg = 0x3032, .val = 0x0000}, // DIGITAL_BINNING
  {.reg = 0x3002, .val = 0x0002}, // Y_ADDR_START = 2
  {.reg = 0x3004, .val = 0x0000}, // X_ADDR_START = 0
  {.reg = 0x3006, .val = 0x03C1}, // Y_ADDR_END
  {.reg = 0x3008, .val = 0x04FF}, // X_ADDR_END = 1279
  {.reg = 0x300A, .val = 0x03DE}, // FRAME_LENGTH_LINES
  {.reg = 0x300C, .val = 0x0672}, // LINE_LENGTH_PCK = 1650
  {.reg = 0x301A, .val = 0x10D8}, // RESET_REGISTER
  {.reg = 0x31D0, .val = 0x0001}, // HDR_COMP

  //Clock settings
  //these clock settings make xx MHz
  {.reg = 0x302E, .val = 0x0009}, // PRE_PLL_CLK_DIV
  {.reg = 0x3030, .val = 0x0096}, // PLL_MULTIPLIER
  {.reg = 0x302C, .val = 0x0006}, // VT_SYS_CLK_DIV was 0x0C
  {.reg = 0x302A, .val = 0x0003}, // VT_PIX_CLK_DIV was 0x0A
  {.reg = 0x0000, .val = 1}, // delay

  {.reg = 0x30B0, .val = 0x1300}, // DIGITAL_TEST
  //{.reg = 0x30B0, .val = 0x5300}, // DIGITAL_TEST with PLL disable
  //delay here
  {.reg = 0x0000, .val = 100}, // delay 100 ms
  {.reg = 0x3100, .val = 0x0000}, // ae_ctrl_reg
  {.reg = 0x3064, .val = 0x1802}, //DISABLE EMB. DATA

  {.reg = 0x301A, .val = 0x10DC},  //Disable Serial, Enable Parallel, Drive Outputs(no hi-z), lock reg, streaming mode(not low power)
  {.reg = 0x0000, .val = 100}, // delay 100 ms

  //{.reg = 0x3070, .val = 0x0000}, //walking 1s test pattern
  {.reg = 0x3070, .val = 0x00100}, //walking 1s test pattern
};

