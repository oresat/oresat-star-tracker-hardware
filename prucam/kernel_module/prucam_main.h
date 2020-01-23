#include <linux/init.h>           // Macros used to mark up functions e.g. __init __exit
#include <linux/module.h>         // Core header for loading LKMs into the kernel
#include <linux/device.h>         // Header to support the kernel Driver Model
#include <linux/kernel.h>         // Contains types, macros, functions for the kernel
#include <linux/fs.h>             // Header for the Linux file system support
#include <linux/uaccess.h>          // Required for the copy to user function
#include <linux/dma-mapping.h>
#include <linux/interrupt.h>
#include <linux/platform_device.h>
#include <linux/i2c.h>
#include <linux/delay.h>
#include <linux/moduleparam.h>

#include "ar0130_ctrl_regs.h"
#include "cam_gpio.h"

MODULE_LICENSE("GPL");            ///< The license type -- this affects available functionality
MODULE_AUTHOR("Oliver Rew");    ///< The author -- visible when you use modinfo
MODULE_DESCRIPTION("write this");  ///< The description -- see modinfo
MODULE_VERSION("0.1");            ///< A version number to inform users

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


