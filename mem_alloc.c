#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <signal.h>
#include <fcntl.h>
#include <ctype.h>
#include <termios.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <sys/time.h>


//this is arbitray and unsafe until I reserve this memory somehow
//#define MEMLOC 0xa0000000 
//#define SIZE 1000000
#define SIZE 1000 //column width, pixel/column
#define PRU_BASE_ADDR 0x4a300000
#define PRU0_RAM 0x00001000
#define MEMLOC (PRU_BASE_ADDR + PRU0_RAM)

#define ARM_2_PRU 0x01
#define PRU_2_ARM 0x02
#define STATUS 0x01 // first memloc is that status/communication register
/*
   BEAGLEBONE MEMORY STRUCTURE
   From What I can tell, the beaglebone's memory structure is 32 bit words located at 
   addresses 0x04 bits apart
 */

#define ROWS 461

int main()
{
	volatile int image[ROWS * SIZE];
	volatile int pos = 0; //this showed the greatest speed gain when changed to volatile???
	//open /dev/mem which gives us access to physical memory

	struct timeval before , after;

	volatile int fd = open("/dev/mem", O_RDWR | O_SYNC);
	if (fd == -1) 
	{
		printf("failed to open\n");
		return 0;
	}

	//mmap our physical mem location to a virtual address
	//should this be volatile and unsigned?
	volatile int *ptr = mmap(0, SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEMLOC);
	if (ptr == MAP_FAILED)
	{
		close(fd);
		perror("Error mmapping the file");
		exit(EXIT_FAILURE);
	}

	//zero status flags
	*ptr &= ~ARM_2_PRU;
	*ptr &= ~PRU_2_ARM;

	//set starting location
	volatile int *addr = ptr + STATUS;

	//zero the space
	for(; addr < (ptr + STATUS + SIZE) ; addr++)
		*addr = 0x00;

	printf("====STARTING\n");
	gettimeofday(&before , NULL);

	//casting ptr to int here slows it down dramatically!
	volatile int *startAddr = ptr + STATUS;

	//HOLY COW, casting ptr to int increased speed x3 !!!
	int max = (int)ptr + STATUS + SIZE;

	for(int i = 0 ; i < ROWS ; ++i)
	{
		//send start flag to PRU
		*ptr |= ARM_2_PRU;

		//printf("Sent Start to PRU\n");
		//wait for response
		while((*ptr & PRU_2_ARM) < 1); //TODO: need a timeout here 
		
			//clear the flag
			*ptr &= ~PRU_2_ARM;

			//reset starting location
			addr = startAddr;

			//copy data	
			for(; addr < (int*)max ; ++addr)
				image[++pos] = *addr;
		
	}
	gettimeofday(&after , NULL);
	printf("====ENDING\n");
	long uSecs = after.tv_usec - before.tv_usec;
	double secs = (double)uSecs / 1000000;
	double data =(double)(SIZE * ROWS * 4);
	double dataRate = data / secs; //bytes per second
	long imageRowData = (1280*12)/8;
	long double imageRowTime =  (long double)imageRowData / ((long double)dataRate / (long double)1000000);
	long double pixelTime = imageRowTime / 1280;
	long double maxFreq = 1 / pixelTime;

	/* Received all the messages the example is complete */
	printf("Elapsed time: %ld uSec\n", uSecs);
	printf("Total Data: %f MB\n", data / (float)1000000);
	printf("Data Rate: %f  MB/Second \n", dataRate / (float)1000000);
	printf("Image Row Data: (1280 x 12 bits) / 8 = %ld B/Row\n", imageRowData);
	printf("Image Row Time: %Lf uS\n", imageRowTime);
	printf("Pixel Time(Row Time / 1280): %Lf nS\n", pixelTime * 1000); 
	printf("Max Frequency: %Lf MHz\n", maxFreq); 

	printf("Deallocating Memory\n");

	//zero status flags
	*ptr &= !ARM_2_PRU;
	*ptr &= !PRU_2_ARM;

	//unmap memory
	munmap(ptr, SIZE);

		for(int i = 0 ; i < ROWS * SIZE ; ++i)
			printf("Image[%d]: %x\n", i, image[i]);
}
