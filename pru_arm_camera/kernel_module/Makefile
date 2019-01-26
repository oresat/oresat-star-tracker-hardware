obj-m+=ebbchar.o
mod_name=ebbchar.ko

all:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) modules
	$(CC) testebbchar.c -o test
ins:
	insmod $(mod_name)
rm:
	rmmod $(mod_name)
	
clean:
	make -C /lib/modules/$(shell uname -r)/build/ M=$(PWD) clean
	rm test
