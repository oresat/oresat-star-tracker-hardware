# prucam device driver
NOTE: This was tested on kernel 4.14.71
```
$ uname -a
Linux beaglebone 4.14.71-ti-r80 #1 SMP PREEMPT Fri Oct 5 23:50:11 UTC 2018 armv7l GNU/Linux
```
## Configure device tree for PRU

- build and deploy device-tree overlay
```
$ cd kernel_module
$ make overlay
$ make deploy_overlay
```

- add this line to you /boot/uEnv.txt file
```
dtb_overlay=/lib/firmware/prudev-00A0.dtbo
```

- also make sure that the correct PRU device tree is selected in /boot/uEnv.txt
```
uboot_overlay_pru=/lib/firmware/AM335X-PRU-RPROC-4-14-TI-00A0.dtbo
```

- Reboot
```
$ sudo reboot
```

## Using the device

- If you haven't done so already, install the kernel headers
```
$ sudo apt-get install linux-headers-`uname -r`
```

- Run everything as root.
```
$ sudo su
```

- Watch dmesg output in other window for activity
```
$ dmesg -w
```

- deploy PRU firmware
```
$ cd pru_code
$ ./deploy
```

- build and insert the kernel module
```
$ cd kernel_module
$ make
$ make ins
```

- run test program
```
$ ./test_dev
```

- This should generate a `capture.pgm` file in that directory. scp this to your
computer to see if it worked!
