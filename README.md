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
