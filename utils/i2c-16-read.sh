#!/usr/bin/python3

# This script writes the board ID to the EEPROM in the OSD3358 and reads
# it back afterwards. I ran it on another pocketbealge using i2c-2, but
# it would probably work on other boards with a i2c peripheral

import io
import fcntl
import sys

# i2c slave address is first argument
slave_addr = int(sys.argv[1], 16)

reg = int(sys.argv[2], 16)

addr_bu = (reg >> 8) & 0xff # address upper byte
addr_bl = reg & 0xff # address lower byte

# I think this is python ioctl/i2c specific magic bytes?
IOCTL_I2C_SLAVE = 0x0703

# open the I2C device and set it up to talk to the slave
f = io.open("/dev/i2c-2", "wb+", buffering=0)
fcntl.ioctl(f, IOCTL_I2C_SLAVE, slave_addr)

# write the register value
f.write(bytearray([addr_bu, addr_bl]))

# read back the register value
v = f.read(2)
print("Reg: ", hex(slave_addr), " Value: 0x", v.hex(), sep='')

