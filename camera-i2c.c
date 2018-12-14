#include "camera-i2c.h"

//char *filename = (char *)"/dev/i2c-2";
//int file_i2c;

/*
 * writeRegs()
 * param *regs : pointer to array of camReg
 * param size : int of size of array in bytes
 * returns exit code int
 */
int writeRegs(camReg *regs, int size)
{
  if (regs == NULL)
  {
    printf("ERROR: array of registers is NULL");
    return 1;
  }

  if(size < 4)
  {
    printf("ERROR: Incorrect Size\n");
    return 1;
  }

  //get length of array TODO I wish there was a better way to do this
  int len = size / sizeof(regs[0]);

  int ret = 0;

  //write all registers
  for(int i = 0 ; i < len ; i++)
  {
    printf("reg = 0x%04x, val = 0x%04x\n", regs[i].reg, regs[i].val);
    int err = i2cWrite(regs[i].reg, regs[i].val);
    if (err > 0)
    {
      printf("ERROR: i2cWrite() returned error code: %d\n", err);
      ret = err;
    }
  }

  return ret;
}

//TODO Write header, handle errors
int i2cDump()
{
  int file_i2c;
  if ((file_i2c = open(FILENAME, O_RDWR)) < 0)
  {
    //ERROR HANDLING: you can check errno to see what went wrong
    printf("Failed to open the i2c bus");
    return 1;
  }

  //acquire i2c bus
  int addr = 0x10; //<<<<<The I2C address of the slave
  if (ioctl(file_i2c, I2C_SLAVE, addr) < 0)
  {
    printf("Failed to acquire bus access and/or talk to slave.\n");
    //ERROR HANDLING; you can check errno to see what went wrong
    return 1;
  }

  struct i2c_rdwr_ioctl_data msgset;
  struct i2c_msg iomsg[2];
  uint8_t buf[2];
  uint8_t reg[2];
  int rc;

  for (uint16_t i = 0x3000; i <= 0x31FC; i += 0x02)
  {
    //set address
    reg[0] = i >> 8;
    reg[1] = i & 0x00ff;

    //message that sends the register to read
    iomsg[0].addr = addr;
    iomsg[0].flags = 0; //no flags means write the contents of buf
    iomsg[0].buf = reg;
    iomsg[0].len = 2; //num bytes to write

    //message that reads back the data
    iomsg[1].addr = addr;
    iomsg[1].flags = I2C_M_RD; //read data
    iomsg[1].buf = buf;
    iomsg[1].len = 2;

    msgset.msgs = iomsg;
    msgset.nmsgs = 2;

    rc = ioctl(file_i2c, I2C_RDWR, &msgset);
    if (rc < 0)
      printf("ioctl error return code %d \n", rc);

    uint16_t val = (buf[0] << 8) | buf[1];

    printf("addr 0x%x : val = 0x%04x\n", i, val);
  }
  return 0;
}


//TODO Write header, handle errors
int i2cWrite(uint16_t reg, uint16_t val)
{
  int file_i2c;
  //reg == 0 means delay
  if(reg == 0)
  {
    printf("Delay %d ms\n", val);
    sleep(.001*val);
    return 0;
  }
  if ((file_i2c = open(FILENAME, O_RDWR)) < 0)
  {
    //ERROR HANDLING: you can check errno to see what went wrong
    printf("Failed to open the i2c bus");
    return 1;
  }

  //acquire i2c bus
  int addr = 0x10; //<<<<<The I2C address of the slave
  if (ioctl(file_i2c, I2C_SLAVE, addr) < 0)
  {
    printf("Failed to acquire bus access and/or talk to slave.\n");
    //ERROR HANDLING; you can check errno to see what went wrong
    return 1;
  }

  struct i2c_rdwr_ioctl_data msgset;
  struct i2c_msg iomsg[2];
  uint8_t r[4];
  int rc;

  //set address(0,1) and data (2,3)
  r[0] = reg >> 8;
  r[1] = reg & 0x00ff;
  r[2] = val >> 8;
  r[3] = val & 0x00ff;

  //message that sends the register to read
  iomsg[0].addr = addr;
  iomsg[0].flags = 0; //no flags means write the contents of buf
  iomsg[0].buf = r;
  iomsg[0].len = 4; //num bytes to write

  msgset.msgs = iomsg;
  msgset.nmsgs = 1;

  rc = ioctl(file_i2c, I2C_RDWR, &msgset);
  if (rc < 0)
  {
    printf("ioctl error return code %d \n", rc);
    return 1;
  }

  printf("Finished Write\n");
  return 0;
}

uint16_t i2cRead(uint16_t reg)
{
  int file_i2c;
  //map the i2c device file
  if ((file_i2c = open(FILENAME, O_RDWR)) < 0)
  {
    //ERROR HANDLING: you can check errno to see what went wrong
    printf("Failed to open the i2c bus");
    return -1;
  }

  //acquire i2c bus
  int addr = 0x10; //<<<<<The I2C address of the slave
  if (ioctl(file_i2c, I2C_SLAVE, addr) < 0)
  {
    printf("Failed to acquire bus access and/or talk to slave.\n");
    //ERROR HANDLING; you can check errno to see what went wrong
    return -1;
  }

  struct i2c_rdwr_ioctl_data msgset;
  struct i2c_msg iomsg[2];
  uint8_t buf[2];
  uint8_t r[2];
  uint16_t val;
  int rc;

  //set register
  r[0] = reg >> 8;
  r[1] = reg & 0x00ff;

  //message that sends the register to read
  iomsg[0].addr = addr;
  iomsg[0].flags = 0; //no flags means write the contents of buf
  iomsg[0].buf = r;
  iomsg[0].len = 2; //num bytes to write

  //message that reads back the data
  iomsg[1].addr = addr;
  iomsg[1].flags = I2C_M_RD; //read data
  iomsg[1].buf = buf;
  iomsg[1].len = 2;

  //set the messages
  msgset.msgs = iomsg;
  msgset.nmsgs = 2;

  rc = ioctl(file_i2c, I2C_RDWR, &msgset);
  if (rc < 0)
  {
    printf("ioctl error return code %d \n", rc);
    return -1;
  }

  //save return buffer into value
  val = (buf[0] << 8) | buf[1];

  //TODO: I should be writing val to a pointer and returning an error
  return val;
}
