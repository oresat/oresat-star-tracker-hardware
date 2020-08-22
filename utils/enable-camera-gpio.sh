#!/bin/bash
set -x

if [ $UID -ne 0 ]
then 
  echo ERROR: must be root
  exit 1
fi

# pass the gpio # and the value to set
set_gpio() {
  set -x
  GPIO=$1
  GPIOPATH=/sys/class/gpio/gpio$GPIO
  VAL=$2

  ls /sys/class/gpio/ | grep gpio$GPIO > /dev/null
  # first export the GPIO is it isnt already
  if [ $? -ne 0 ]; then
    echo "File not found!"
    echo $GPIO > /sys/class/gpio/export
  fi

  # set GPIO direction
  echo out > $GPIOPATH/direction

  # set GPIO value
  echo $VAL > $GPIOPATH/value
}

# enable camera output active low
set_gpio 96 0

# enable camera clock clk active high
set_gpio 106 1

# disable reset active low (drive high)
set_gpio 84 1

# set i2c address with saddr line low (0x20)
set_gpio 83 0

# disable standby active high (drive low)
set_gpio 82 0

# no trigger active high
set_gpio 98 0

# enable voltage regulators on image sensor active high
set_gpio 100 1

# finally, enable image sensor control lines so all the
# above signals are sent to image sensor
set_gpio 85 0 


