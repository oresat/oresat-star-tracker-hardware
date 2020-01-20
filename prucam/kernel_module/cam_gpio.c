#include "cam_gpio.h"

// camera parallel bus enable
gpio gpio_bus_oe = {
  .num = GPIO_BUS_OE,
  .init = 1, // active low, disabled
  .enable = 0,
  .label = "bus_oe"
};

// image sensor output enable
gpio gpio_cam_oe = {
  .num = GPIO_CAM_OE,
  .init = 1, // active low, disabled
  .enable = 0, 
  .label = "cam_oe"
};

// image sensor clock enable
gpio gpio_clk_en = {
  .num = GPIO_CLK_EN,
  .init = 0, // active high, disabled
  .enable = 1,
  .label = "clk_en"
};

// image sensor control input buffer enable
gpio gpio_input_en = {
  .num = GPIO_INPUT_EN,
  .init = 1, // active low, disabled
  .enable = 0, 
  .label = "input_en"
};

// image sensor reset
gpio gpio_reset = {
  .num = GPIO_RESET,
  .init = 0, // active low, reset enabled at start
  .enable = 0, // low puts in reset, drive high to enable image sensor
  .label = "reset"
};

// image sensor i2c addr select
gpio gpio_saddr = {
  .num = GPIO_SADDR,
  .init = 0, // active low, 0 = 0x20, 1 = 0x30
  .enable = 1,
  .label = "saddr"
};

// image sensor standby
gpio gpio_standby = {
  .num = GPIO_STANDBY,
  .init = 1, // active high, enabled at start
  .enable = 1,
  .label = "bus_oe"
};

// image sensor trigger
gpio gpio_trigger = {
  .num = GPIO_TRIGGER,
  .init = 0, // active high
  .enable = 1,
  .label = "trigger"
};

// image sensor voltage regulator enable
gpio gpio_vreg_en = {
  .num = GPIO_VREG_EN,
  .init = 0, // active high, disabled
  .enable = 1,
  .label = "vreg_en"
};

int init_cam_gpio(void){
  int r, num; 
  bool init;
  char* label;

  // create array with all the outputs we need to initialize
  gpio* cam_ctrl_gpio[] = {
    &gpio_bus_oe,
    &gpio_cam_oe,
    &gpio_clk_en,
    &gpio_input_en,
    &gpio_reset,
    &gpio_saddr,
    &gpio_standby,
    &gpio_trigger,
    &gpio_vreg_en,
    NULL // terminate array will null 
  };

  // loop through and initialize each gpio
  for(int i = 0 ;; i++) {

    // stop when entry is NULL
    if(cam_ctrl_gpio[i] == (gpio*)NULL)
      return 0;

    // get vals from current gpio
    num = cam_ctrl_gpio[i]->num;
    label = cam_ctrl_gpio[i]->label;
    init = cam_ctrl_gpio[i]->init;

    // request gpio
    if((r = gpio_request(num, label))) {
      printk(KERN_ERR "error requesting gpio %d '%s'\n", num, label);
      return r ;
    }

    // set gpio tp output with initial value
    if((r = gpio_direction_output(num, init))) {
      printk(KERN_ERR "error setting gpio %d '%s' as output\n", num, label);
      return r; 
    }
  }
  return 0;
}

void camera_enable(void) {
  gpio_set_value(gpio_vreg_en.num, gpio_vreg_en.enable);
  // TODO should maybe delay here
  gpio_set_value(gpio_reset.num, !gpio_reset.enable); // disable reset
  gpio_set_value(gpio_standby.num, !gpio_standby.enable); // disable standby
  gpio_set_value(gpio_clk_en.num, gpio_clk_en.enable);

  gpio_set_value(gpio_input_en.num, gpio_input_en.enable);
  gpio_set_value(gpio_cam_oe.num, gpio_cam_oe.enable);
  gpio_set_value(gpio_bus_oe.num, gpio_bus_oe.enable);
}

