obj-m += prucam.o
prucam-objs += prucam_main.o cam_gpio.o
mod_name=prucam.ko
ccflags-y := -std=gnu99 -Wno-declaration-after-statement #this disables the C90 warnings
dto=prudev-00A0

all: module

module:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules $(ccflag-y) 

ins:
	insmod $(mod_name)
rm:
	rmmod $(mod_name)
	
clean:
	@make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean > /dev/null 
	rm -f prudev-00A0.dtbo

deploy:
	cp prucam.ko /lib/modules/4.14.71-ti-r80/kernel/drivers/remoteproc
	depmod

# Compile and install device tree
overlay: $(dto).dtbo

$(dto).dtbo: $(dto).dts
	dtc -O dtb -o $(dto).dtbo -b 0 -@ $(dto).dts

deploy_overlay:
	cp -v $(dto).dtbo /lib/firmware
