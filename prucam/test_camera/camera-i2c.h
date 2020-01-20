#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>                        //Needed for I2C port
#include <sys/ioctl.h>                    //Needed for I2C port
#include <linux/i2c-dev.h>                //Needed for I2C port
#include <linux/i2c.h>                    //Needed for I2C port
#include <time.h>
#include <unistd.h>                       //Needed for I2C port

#define FILENAME (char *)"/dev/i2c-2"

typedef struct
{
  uint16_t reg;
  uint16_t val;
}camReg;

int i2cWrite(uint16_t reg, uint16_t val);
int i2cDump();
uint16_t i2cRead(uint16_t reg);
int writeRegs(camReg regs[], int size);



