#!/usr/bin/python3

# This script writes the board ID to the EEPROM in the OSD3358 and reads
# it back afterwards. I ran it on another pocketbealge using i2c-2, but
# it would probably work on other boards with a i2c peripheral

import io
import fcntl

# I think this is python ioctl/i2c specific? not sure
IOCTL_I2C_SLAVE = 0x0703

# board ID byte array, notice 2 non-ascii hex chars
board_id = b"\xaaU3\xeeA335PBGL00A21740GPB43424"

# start of i2c message with EEPROM 16 bit address 0x0000
msg = bytearray([0x00, 0x00])

# append board ID to address to create full message
msg.extend(board_id)

# open the I2C device and set it up to talk to the slave
f = io.open("/dev/i2c-2", "wb+", buffering=0)
fcntl.ioctl(f, IOCTL_I2C_SLAVE, 0x50)

# write the board ID message to the EEPROM
f.write(msg)

# after receiving the write bytes, the EEPROM takes some time to write it to
# memory. The chip with NAK during this time, so the datasheet suggests polling
# the chip via i2c until it acks a command, at which point it can handle more
# commands. Here we attempt the initial command of reading back what we just
# wrote(which is a write to 0x0000), and when the chip ACKs the command, we can
# proceed with the read
while True:
    # attempt the write to setup a read from 0x0000
    try:
        f.write(bytearray([0x00, 0x00]))
        break
    # handle the OSError exception returned when we get a NAK
    except OSError as err:
        continue

# read back the board id and print it
v = f.read(len(board_id))
print("Board ID:", v)
