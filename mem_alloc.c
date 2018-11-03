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
#define SIZE 1000 //column width, pixel/column
#define PRU_BASE_ADDR 0x4a300000
#define STATUS 0x1000
#define PRU0_RAM 0x00010000
#define MEMLOC (PRU_BASE_ADDR + PRU0_RAM)
#define STATUS_MEM (PRU_BASE_ADDR + STATUS)

#define ARM_2_PRU 0x01
#define PRU_2_ARM 0x02
/*
   BEAGLEBONE MEMORY STRUCTURE
   From What I can tell, the beaglebone's memory structure is 32 bit words located at 
   addresses 0x04 bits apart
 */

#define ROWS 461

int main()
{
	int image[ROWS * SIZE];
	volatile int pos = 0; //this showed the greatest speed gain when changed to volatile???
	//open /dev/mem which gives us access to physical memory

	struct timeval before , after;

	int fd = open("/dev/mem", O_RDWR | O_SYNC);
	if (fd == -1) 
	{
		printf("failed to open\n");
		return 0;
	}

	int *status = mmap(0, 4, PROT_READ | PROT_WRITE, MAP_SHARED, fd, STATUS_MEM);
	if (status == MAP_FAILED)
	{
		close(fd);
		perror("Error mmapping the file");
		exit(EXIT_FAILURE);
	}

	//mmap our physical mem location to a virtual address
	//should this be volatile and unsigned?
	int *ptr = mmap(0, SIZE*4, PROT_READ | PROT_WRITE, MAP_SHARED, fd, MEMLOC);
	if (ptr == MAP_FAILED)
	{
		close(fd);
		perror("Error mmapping the file");
		exit(EXIT_FAILURE);
	}

	//zero status flags
	*status &= ~ARM_2_PRU;
	*status &= ~PRU_2_ARM;

	//set starting location
	//casting ptr to int here slows it down dramatically!
	volatile int *addr;
	addr = ptr;

	//zero the space
	for(int *tempAddr = (int*)addr; tempAddr < addr + SIZE; tempAddr++)
		*tempAddr = 0x00;

	printf("====STARTING\n");
	gettimeofday(&before , NULL);

	for(int i = 0 ; i < ROWS ; ++i)
	{
		//send start flag to PRU
		*status |= ARM_2_PRU;

		//wait for response
		while((*status & PRU_2_ARM) < 1); //TODO: need a timeout here 

		//clear the flag
		*status &= ~PRU_2_ARM;

		//copy data	
		memcpy(&(image[pos]), (void*)addr, SIZE*4);
		pos += 1000;
	}

	gettimeofday(&after , NULL);
	printf("====ENDING\n");
	printf("pos: %d\n", pos);
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

	int end = ROWS * SIZE;

	int diff;
	for(int i = 0 ; i < end ; ++i)
	{
		diff = image[i+1] - image[i];
		if( i == end -1)
			continue;
		if(diff != 1)
			printf("image[%d]: %x, image[%d]: %x, diff: %d\n",i ,image[i], i+1, image[i+1], diff);
	//	printf("Image[%d]: %x\n", i, image[i]);
	}

}
