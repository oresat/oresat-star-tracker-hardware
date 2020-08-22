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
set_gpio 96 1

# enable camera clock clk active high
set_gpio 106 0

# disable reset active low 
set_gpio 84 0

# disable standby active high 
set_gpio 82 1

# enable voltage regulators on image sensor active high
set_gpio 100 0

# finally, enable image sensor control lines so all the
# above signals are sent to image sensor
set_gpio 85 0 


