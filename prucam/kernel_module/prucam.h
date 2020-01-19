#include <linux/init.h>           // Macros used to mark up functions e.g. __init __exit
#include <linux/module.h>         // Core header for loading LKMs into the kernel
#include <linux/device.h>         // Header to support the kernel Driver Model
#include <linux/kernel.h>         // Contains types, macros, functions for the kernel
#include <linux/fs.h>             // Header for the Linux file system support
#include <linux/uaccess.h>          // Required for the copy to user function
#include <linux/gpio.h>           // required for GPIO access
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/i2c.h>
#include <linux/delay.h>
#include "regs_kern2.h" //TODO change name

#define DEVICE_NAME "prucam"    ///< The device will appear at /dev/prucam using this value
#define CLASS_NAME  "pru"        ///< The device class -- this is a character device driver
#define ROWS 960
#define COLS 1280
#define SIZE ROWS*COLS
#define PIXELS ROWS * COLS
#define PRUBASE 0x4a300000
#define PRUSHAREDRAM PRUBASE + 0x10000
#define PRUINTC_OFFSET 0x20000
#define SRSR0_OFFSET 0x200
#define NUM_IRQS 8

// Camera Control Pin Numbers
#define GPIO_FLASH 16
#define GPIO_BUS_OE 97
#define GPIO_CAM_OE 96
#define GPIO_CLK_EN 106
#define GPIO_INPUT_EN 85
#define GPIO_RESET 84
#define GPIO_SADDR 83
#define GPIO_STANDBY 82
#define GPIO_TRIGGER 98
#define GPIO_VREG_EN 100

typedef struct {
  uint8_t num;
  bool init;
  bool enable; 
  char* label;
} gpio;

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

  
