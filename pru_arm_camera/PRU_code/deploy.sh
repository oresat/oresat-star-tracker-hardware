#! /bin/bash

##############################################################################
#
# Source Modified by Pierrick Rauby <PierrickRauby - pierrick.rauby@gmail.com>
# Based on the examples distributed by TI
# Copyright (C) 2016 Zubeen Tolani <ZeekHuge - zeekhuge@gmail.com>
#############################################################################

export PRU_CGT=/usr/share/ti/cgt-pru
# The script builds, uploads, and starts PRU image capture firmware 

#If changing these variables, make sure the given pin can be muxed to the given pru.
#PRU_CORE should be either 0 or 1
PRU_CORE=0

PRU0_0=P1_36 #D0
PRU0_1=P1_33 #D1
PRU0_2=P2_32 #D2
PRU0_3=P2_30 #D3
PRU0_4=P1_31 #D4
PRU0_5=P2_34 #D5
PRU0_6=P2_28 #D6
PRU0_7=P1_29 #D7
PRU0_14=P2_22 #VSYNC
PRU0_15=P2_18 #HSYNC
PRU0_16=P1_20 #PIXCLK
PRU0_15O=P2_33 #OUT


#echo "*******************************************************"
#echo "This must be compiled on the BEAGLEBONE BLACK itself"

echo "-Building project"
	make clean
	make || exit 1

echo "-Placing the firmware"
	cp gen/*.out /lib/firmware/am335x-pru$PRU_CORE-fw

echo "-Configuring pinmux"

	#Setup Inputs
	config-pin -a $PRU0_0 pruin
	config-pin -q $PRU0_0
	config-pin -a $PRU0_1 pruin
	config-pin -q $PRU0_1
	config-pin -a $PRU0_2 pruin
	config-pin -q $PRU0_2
	config-pin -a $PRU0_3 pruin
	config-pin -q $PRU0_3
	config-pin -a $PRU0_4 pruin
	config-pin -q $PRU0_4
	config-pin -a $PRU0_5 pruin
	config-pin -q $PRU0_5
	config-pin -a $PRU0_6 pruin
	config-pin -q $PRU0_6
	config-pin -a $PRU0_7 pruin
	config-pin -q $PRU0_7
	config-pin -a $PRU0_14 pruin
	config-pin -q $PRU0_14
	config-pin -a $PRU0_15 pruin
	config-pin -q $PRU0_15
	config-pin -a $PRU0_16 pruin
	config-pin -q $PRU0_16
	config-pin -a $PRU0_15O pruout
	config-pin -q $PRU0_15O

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

