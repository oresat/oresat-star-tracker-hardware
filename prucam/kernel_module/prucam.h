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
#define BUS_OE 97
#define CAM_OE 96
#define CLK_EN 106
#define INPUT_EN 85
#define RESET 84
#define SADDR 83
#define STANDBY 82
#define TRIGGER 98
#define VREG_EN 100
