# pru_arm_transfer

Run everything as root.
$sudo -s

upload FW to the PRU first
$ cd PRU_code
$ ./deploy.sh

make Linux C program(from `pru_arm_transfer` directory)
$ make

run program
$ ./camera_arm.c
