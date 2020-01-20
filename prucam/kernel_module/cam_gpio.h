#include <linux/module.h> // needed for LKM macros and such
#include <linux/kernel.h>         // Contains types, macros, functions for the kernel
#include <linux/gpio.h>   

// Module license, without this many funcs can't be used
MODULE_LICENSE("GPL");

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

int init_cam_gpio(void);
void camera_enable(void); 

typedef struct {
  uint8_t num;
  bool init;
  bool enable; 
  char* label;
} gpio;

