typedef struct
{
  uint16_t reg;
  uint16_t val;
}camReg;

camReg startupRegs[] = {

  //TODO should insert a reset here to clear registers

  //Below are a bunch of register writes to largely undocumented registers that
  //we pulled from the init sequence of an AR0130 sensor git repo. While I don't know
  //what they mean, the outcome is the picture has a lot less noise afterwards.
  //Likewise, the annotations suggest it is initing the ADCs and DACs. While,
  //I don't love having a binary blob in here, it does improve the image
  {.reg = 0x309E, .val = 0x0000}, //DCDS_PROG_START_ADDR
  {.reg = 0x30E4, .val = 0x6372}, //ADC_BITS_6_7
  {.reg = 0x30E2, .val = 0x7253}, //ADC_BITS_4_5
  {.reg = 0x30E0, .val = 0x5470}, //ADC_BITS_2_3
  {.reg = 0x30E6, .val = 0xC4CC}, //ADC_CONFIG1
  {.reg = 0x30E8, .val = 0x8050}, //ADC_CONFIG2
  {.reg = 0x3082, .val = 0x0029}, //OP MODE CTL
  {.reg = 0x301E, .val = 0x00C8}, // DATA_PEDESTAL documented
  {.reg = 0x3EDA, .val = 0x0F03}, // DAC_LD_14_15
  {.reg = 0x3EDE, .val = 0xC005}, // DAC_LD_18_19
  {.reg = 0x3ED8, .val = 0x09EF}, // DAC_LD_12_13
  {.reg = 0x3EE2, .val = 0xA46B}, // DAC_LD_22_23
  {.reg = 0x3EE0, .val = 0x047D}, // DAC_LD_20_21
  {.reg = 0x3EDC, .val = 0x0070}, // DAC_LD_16_17
  {.reg = 0x3044, .val = 0x0404}, // DARK_CONTROL documented
  {.reg = 0x3EE6, .val = 0x4303}, // DAC_LD_26_27
  {.reg = 0x3EE4, .val = 0xD208}, // DAC_LD_24_25
  {.reg = 0x3ED6, .val = 0x00BD}, // DAC_LD_10_11
  //END BINARY BLOB
  
  {.reg = 0x3028, .val = 0x0010}, //row_speed: Dout on rising edge pixclk DEFAULT

  //Pixel clock settings:
  //PIXCLK = (EXTCLK[27MHz] * pll_multiplier) / (pre_pll_clk_div * vt_sys_clk_div * vt_pix_clk_div)
  {.reg = 0x302E, .val = 0x0009}, //pre_pll_clk_div
  {.reg = 0x3030, .val = 0x0096}, //pll_mulitplier
  {.reg = 0x302C, .val = 0x0009}, //vt_sys_clk_div
  {.reg = 0x302A, .val = 0x0004}, //vt_pix_clk_div

  {.reg = 0x3032, .val = 0x0000}, //digital binning: no binning DEFAULT
  {.reg = 0x30B0, .val = 0x0080}, //digital test: context A, monochrome mode DEFAULT
  {.reg = 0x301A, .val = 0x10DC}, //reset_register: disable serial, parallel enabled, parallel driven, standby at end of frame
  {.reg = 0x300C, .val = 0x0672}, //line_length_pck: 1650 pix clks per line, including horiz blanking
  {.reg = 0x3002, .val = 0x0000}, //y_addr_start: start y at 0, no windowing DEFAULT
  {.reg = 0x3004, .val = 0x0000}, //x_addr_start: start x at 0 no windowing DEFAULT
  {.reg = 0x3006, .val = 0x03BF}, //y_addr_end: end y at 959, DEFAULT
  {.reg = 0x3008, .val = 0x04FF}, //x_addr_end: end x at 1279, DEFAULT
  {.reg = 0x300A, .val = 0x03DE}, //frame_length_lines: 990 rows per frame, including vertical blanking DEFAULT

  //Exposure Time = coarse_integration_time + fine integration time  
  //coarse_integration_time: integration(exposure) time specifed in multiples
  //of 'line_length_pck'. This means the coarse exposure time is the pixel
  //clock period * line_length_pck. 
  {.reg = 0x3012, .val = 0x000f}, 

  //fine_integration_time: additional integration time added to coarse
  //integration time measured in single pixel clock times
  {.reg = 0x3014, .val = 0x00C0}, 

  {.reg = 0x30A6, .val = 0x0001}, //y_odd_inc: skip no rows
  {.reg = 0x3040, .val = 0x0000}, //read_mode: normal readout mode DEFAULT
  {.reg = 0x3064, .val = 0x1802}, //embedded_data_control: Embedded data disabled
  {.reg = 0x31C6, .val = 0x8000}, //hispi_control_status: all HISPI options off: DEFAULT

  {0, 0}, //blank entry to terminate array 
};

  /*
     {.reg = 0x301A, .val = 0x0001}, //RESET
     {.reg = 0x301A, .val = 0x10D8}, //Disable Serial, Enable Parallel, Drive Outputs(no hi-z), lock reg
     {.reg = 0x3086, .val = 0x0225}, //SEQ RAM
     {.reg = 0x3086, .val = 0x5050}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2D26}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0828}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0D17}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0926}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0028}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0526}, //SEQ RAM
     {.reg = 0x3086, .val = 0xA728}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0725}, //SEQ RAM
     {.reg = 0x3086, .val = 0x8080}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2917}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0525}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0040}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2702}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1616}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2706}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1736}, //SEQ RAM
     {.reg = 0x3086, .val = 0x26A6}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1703}, //SEQ RAM
     {.reg = 0x3086, .val = 0x26A4}, //SEQ RAM
     {.reg = 0x3086, .val = 0x171F}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2805}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2620}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2804}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2520}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2027}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0017}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1E25}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0020}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2117}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1028}, //SEQ RAM
     {.reg = 0x3086, .val = 0x051B}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1703}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2706}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1703}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1747}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2660}, //SEQ RAM
     {.reg = 0x3086, .val = 0x17AE}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2500}, //SEQ RAM
     {.reg = 0x3086, .val = 0x9027}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0026}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1828}, //SEQ RAM
     {.reg = 0x3086, .val = 0x002E}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2A28}, //SEQ RAM
     {.reg = 0x3086, .val = 0x081E}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0831}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1440}, //SEQ RAM
     {.reg = 0x3086, .val = 0x4014}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2020}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1410}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1034}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1014}, //SEQ RAM
     {.reg = 0x3086, .val = 0x0020}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
     {.reg = 0x3086, .val = 0x4013}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1802}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1470}, //SEQ RAM
     {.reg = 0x3086, .val = 0x7004}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1470}, //SEQ RAM
     {.reg = 0x3086, .val = 0x7003}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1470}, //SEQ RAM
     {.reg = 0x3086, .val = 0x7017}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2002}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
     {.reg = 0x3086, .val = 0x2002}, //SEQ RAM
     {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
  {.reg = 0x3086, .val = 0x5004}, //SEQ RAM
  {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
  {.reg = 0x3086, .val = 0x2004}, //SEQ RAM
  {.reg = 0x3086, .val = 0x1400}, //SEQ RAM
  {.reg = 0x3086, .val = 0x5022}, //SEQ RAM
  {.reg = 0x3086, .val = 0x0314}, //SEQ RAM
  {.reg = 0x3086, .val = 0x0020}, //SEQ RAM
  {.reg = 0x3086, .val = 0x0314}, //SEQ RAM
  {.reg = 0x3086, .val = 0x0050}, //SEQ RAM
  {.reg = 0x3086, .val = 0x2C2C}, //SEQ RAM
  {.reg = 0x3086, .val = 0x2C2C}, //SEQ RAM
  {.reg = 0x309E, .val = 0x0000}, //DCDS_PROG_START_ADDR undocumented
  {.reg = 0x30E4, .val = 0x6372}, //ADC_BITS_6_7 undocumented
  {.reg = 0x30E2, .val = 0x7253}, //ADC_BITS_4_5
  {.reg = 0x30E0, .val = 0x5470}, //ADC_BITS_2_3
  {.reg = 0x30E6, .val = 0xC4CC}, //ADC_CONFIG1
  {.reg = 0x30E8, .val = 0x8050}, //ADC_CONFIG2
  //{.reg = 0x0000, .val = 1}, // delay 100 ms
  //delay here
  {.reg = 0x3082, .val = 0x0029}, //OP MODE CTL undocumented
  {.reg = 0x301E, .val = 0x00C8}, // DATA_PEDESTAL
  {.reg = 0x3EDA, .val = 0x0F03}, // DAC_LD_14_15
  {.reg = 0x3EDE, .val = 0xC005}, // DAC_LD_18_19
  {.reg = 0x3ED8, .val = 0x09EF}, // DAC_LD_12_13
  {.reg = 0x3EE2, .val = 0xA46B}, // DAC_LD_22_23
  {.reg = 0x3EE0, .val = 0x047D}, // DAC_LD_20_21
  {.reg = 0x3EDC, .val = 0x0070}, // DAC_LD_16_17
  {.reg = 0x3044, .val = 0x0404}, // DARK_CONTROL //DEFAULT
  {.reg = 0x3EE6, .val = 0x4303}, // DAC_LD_26_27
  {.reg = 0x3EE4, .val = 0xD208}, // DAC_LD_24_25
  {.reg = 0x3ED6, .val = 0x00BD}, // DAC_LD_10_11
  {.reg = 0x30B0, .val = 0x1300}, // DIGITAL_TEST
  {.reg = 0x30D4, .val = 0xE007}, // COLUMN_CORRECTION DEFAULT!
  {.reg = 0x3012, .val = 0x00a0}, // COARSE_INTEGRATION_TIME
  {.reg = 0x3032, .val = 0x0000}, // DIGITAL_BINNING
  {.reg = 0x3002, .val = 0x0002}, // Y_ADDR_START = 2
  {.reg = 0x3004, .val = 0x0000}, // X_ADDR_START = 0
  {.reg = 0x3006, .val = 0x03C1}, // Y_ADDR_END
  {.reg = 0x3008, .val = 0x04FF}, // X_ADDR_END = 1279
  {.reg = 0x300A, .val = 0x03DE}, // FRAME_LENGTH_LINES
  {.reg = 0x300C, .val = 0x0672}, // LINE_LENGTH_PCK = 1650
  {.reg = 0x301A, .val = 0x10D8}, // RESET_REGISTER
  {.reg = 0x31D0, .val = 0x0001}, // HDR_COMP //undocumented

  //Clock settings
  //these clock settings make xx MHz
  {.reg = 0x302E, .val = 0x0009}, // PRE_PLL_CLK_DIV
  {.reg = 0x3030, .val = 0x0096}, // PLL_MULTIPLIER
  {.reg = 0x302C, .val = 0x0006}, // VT_SYS_CLK_DIV was 0x0C
  {.reg = 0x302A, .val = 0x0003}, // VT_PIX_CLK_DIV was 0x0A
  {.reg = 0x0000, .val = 1}, // delay after setting PLL

  {.reg = 0x3100, .val = 0x0000}, // ae_ctrl_reg
  {.reg = 0x3064, .val = 0x1802}, //DISABLE EMB. DATA

  {.reg = 0x301A, .val = 0x10DC},  //Disable Serial, Enable Parallel, Drive Outputs(no hi-z), lock reg, streaming mode(not low power)
  */	
