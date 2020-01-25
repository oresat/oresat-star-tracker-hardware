#!/usr/bin/python3

# This script writes the board ID to the EEPROM in the OSD3358 and reads
# it back afterwards. I ran it on another pocketbealge using i2c-2, but
# it would probably work on other boards with a i2c peripheral

import io
import fcntl

# I think this is python ioctl/i2c specific? not sure
IOCTL_I2C_SLAVE = 0x0703

# open the I2C device and set it up to talk to the slave
f = io.open("/dev/i2c-2", "wb+", buffering=0)
fcntl.ioctl(f, IOCTL_I2C_SLAVE, 0x10)

# f.write(bytearray([0x30, 0x70, 0x01, 0x00]))
f.write(bytearray([0x30, 0x70, 0x00, 0x00]))

