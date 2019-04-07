obj-m+=ebbchar.o
mod_name=ebbchar.ko
ccflags-y := -std=gnu99 -Wno-declaration-after-statement #this disables the C90 warnings
dto=prudev-00A0

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules $(ccflag-y) 
	$(CC) testebbchar.c -o test
ins:
	insmod $(mod_name)
rm:
	rmmod $(mod_name)
test: rm ins
	./test
	
clean:
	@make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean > /dev/null &
	@rm test &


deploy:
	cp ebbchar.ko /lib/modules/4.14.71-ti-r80/kernel/drivers/remoteproc
	depmod

# Compile and install device tree
overlay: $(dto).dtbo

$(dto).dtbo: $(dto).dts
	dtc -O dtb -o $(dto).dtbo -b 0 -@ $(dto).dts

deploy_overlay:
	cp -v $(dto).dtbo /lib/firmware
