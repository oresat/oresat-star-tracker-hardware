# oresat-star-tracker

This is the repository for all things related to the star tracker system for OreSat. 

We intend to base our star tracking system on [OpenStarTracker, from the University of Buffalo](http://openstartracker.org "OpenStarTracker, from the University of Buffalo").

Below is an explanation of each directory:

- STM32F4-camera-system - OreSat camera system based on the STM32F4 MCU
- archive - old files and projects no longer in use
- camera_testing - files related to testing our AR0130-based cameras
- openstartracker - star tracker software, based on OpenStarTracker from Univ. of Buffalo
- oresat-camera-hardware - directories related to hardware for OreSat camera system

# pru_arm_transfer

Run everything as root.
$sudo su

I wrote a script that does everything, just execute it with:
$ ./run.sh

It's first building and uploaded the firmware to the PRU, then making the ARM
side program which programs the camera via i2c and lastly tells the PRU to
start the transfer and receives the image. Image is saved as 'capture.pgm',
you'll have to scp it onto your machine to view it. pgm is a very simple image
format.
