#! /bin/bash
set -e

##############################################################################
#
# Source Modified by Pierrick Rauby <PierrickRauby - pierrick.rauby@gmail.com>
# Based on the examples distributed by TI
# Copyright (C) 2016 Zubeen Tolani <ZeekHuge - zeekhuge@gmail.com>
#
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#	* Redistributions of source code must retain the above copyright
#	  notice, this list of conditions and the following disclaimer.
#
#	* Redistributions in binary form must reproduce the above copyright
#	  notice, this list of conditions and the following disclaimer in the
#	  documentation and/or other materials provided with the
#	  distribution
#
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#############################################################################


# The script builds the Hello_PRU project and configures the pinmuxing for $HEADER$PIN_NUM

#If changing these variables, make sure the given pin can be muxed to the given pru.
#HEADER=P8_
#PIN_NUMBER=41
#PRU_CORE should be either 0 or 1
PRU_CORE=0

#PIN1=P8_41 #PRU1_GPO4
#PIN2=P8_42 #PRU1_GPO5
#PIN3=P8_44 #PRU1_GPO3
#PIN4=


PIN1=P9_31 #PRU0_GPO0
PIN2=P9_29 #PRU0_GPO1
PIN3=P9_30 #PRU0_GPO2
PIN4=P9_28 #PRU0_GPO3
PIN5=P9_27 #PRU0_GPO3



echo "*******************************************************"
echo "This must be compiled on the BEAGLEBONE BLACK itself"
echo "It was tested on 4.9.12-ti-r57 kernel version"
echo "The source code for Hello_PRU ie PRU_gpioToggle was taken from"
echo "pru-software-support-package and can be cloned from"
echo "git clone git://git.ti.com/pru-software-support-package/pru-software-support-package.git"

echo "-Building project"
	make clean
	make

echo "-Placing the firmware"
	cp gen/*.out /lib/firmware/am335x-pru$PRU_CORE-fw

echo "-Configuring pinmux"
	#config-pin -a $HEADER$PIN_NUMBER pruout
	#config-pin -q $HEADER$PIN_NUMBER

	#Setup Outputs
	config-pin -a $PIN1 pruout
	config-pin -q $PIN1
	config-pin -a $PIN2 pruout
	config-pin -q $PIN2
	config-pin -a $PIN3 pruout
	config-pin -q $PIN3
	config-pin -a $PIN4 pruout
	config-pin -q $PIN4

	#Setup Inputs
	config-pin -a $PIN5 pruin
	config-pin -q $PIN5


echo "-Rebooting"
	if [ $PRU_CORE -eq 0 ]
	then
		echo "Rebooting pru-core 0"
		echo 'stop' > /sys/class/remoteproc/remoteproc1/state
		echo 'start' > /sys/class/remoteproc/remoteproc1/state
	else
		echo "Rebooting pru-core 1"
		echo 'stop' > /sys/class/remoteproc/remoteproc2/state
		echo 'start' > /sys/class/remoteproc/remoteproc2/state
	fi

echo "Done. The LED on pin $HEADER$PIN_NUMBER must be blinking "
