obj-m+=prucam.o
mod_name=prucam.ko
ccflags-y := -std=gnu99 -Wno-declaration-after-statement #this disables the C90 warnings
dto=prudev-00A0

all: tester module

tester:
	$(CC) testprucam.c camera-i2c.c -o test_dev

module:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules $(ccflag-y) 

ins:
	insmod $(mod_name)
rm:
	rmmod $(mod_name)
test: rm ins
	./test
	
clean:
	@make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean > /dev/null 
	rm -f test_dev
	rm -f prudev-00A0.dtbo
	rm -f capture.pgm

deploy:
	cp prucam.ko /lib/modules/4.14.71-ti-r80/kernel/drivers/remoteproc
	depmod

# Compile and install device tree
overlay: $(dto).dtbo

$(dto).dtbo: $(dto).dts
	dtc -O dtb -o $(dto).dtbo -b 0 -@ $(dto).dts

deploy_overlay:
	cp -v $(dto).dtbo /lib/firmware
