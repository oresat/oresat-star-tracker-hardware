#include "arm_camera.h"

int main()
{
  initCamera();
  int image[ROWS * CELLS];
  volatile int pos = 0; //this showed the greatest speed gain when changed to volatile???

  struct timeval before , after;

  //open /dev/mem which gives us access to physical memory
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

  *status = 0x00000000;

  //mmap our physical mem location to a virtual address
  //Map 2 buffers
  int *buf0 = mmap(0, CELLS, PROT_READ | PROT_WRITE, MAP_SHARED, fd, BUF0);
  if (buf0 == MAP_FAILED)
  {
    close(fd);
    perror("Error mmapping the file");
    exit(EXIT_FAILURE);
  }
  int *buf1 = mmap(0, CELLS, PROT_READ | PROT_WRITE, MAP_SHARED, fd, BUF1);
  if (buf1 == MAP_FAILED)
  {
    close(fd);
    perror("Error mmapping the file");
    exit(EXIT_FAILURE);
  }

  //zero status flags
  *status &= ~ARM_2_PRU;
  *status &= ~PRU_2_ARM;
  *status &= ~END;

  //zero the space
  for(int *tempAddr = buf0; tempAddr < (buf0 + CELLS); tempAddr++)
    *tempAddr = 0x00;

  //zero the space
  for(int *tempAddr = buf1; tempAddr < (buf1 + CELLS); tempAddr++)
    *tempAddr = 0x00;

  printf("====STARTING\n");
  gettimeofday(&before , NULL);

  //send start flag to PRU
  *status |= ARM_2_PRU;

  for(int i = 0 ; i < ROWS ; ++i)
  {
    if((*status & END) > 0) //TODO: need a timeout here 
    {
      printf("End Frame\n");
      break;
    }

    //wait for response
    while((*status & PRU_2_ARM) < 1) //TODO: need a timeout here 
      for(int i = 0 ; i < 2 ; i++); //this is purely for a small delay so this while loop doesn't hog reading the memory

    //clear the flag
    *status &= ~PRU_2_ARM;

    if(*status & BUF)
    {
      //read from buf1
      memcpy(&(image[pos]), (void*)buf1, COLS);
      pos += CELLS;
    }
    else
    {
      //read from buf0
      memcpy(&(image[pos]), (void*)buf0, COLS);
      pos += CELLS;
    }
  }

  gettimeofday(&after , NULL);
  printf("====ENDING\n");
  long uSecs = after.tv_usec - before.tv_usec;
  double secs = (double)uSecs / 1000000;
  double data =(double)((COLS * ROWS * 12)/8); //bytes
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

  //unmap memory
  munmap(status, CELLS);
  munmap(buf0, CELLS);
  munmap(buf1, CELLS);

  //int end = ROWS * CELLS;
  int end = 1000;

  for(int i = 0 ; i < end ; ++i)
  {
    //		printf("Image[%d]: %08x\n", i, image[i]);
  }

  //int image[ROWS * COLS];

  FILE* pgmimg; 
  pgmimg = fopen("capture.pgm", "wb"); 

  // Writing Magic Number to the File 
  fprintf(pgmimg, "P2\n");  

  // Writing Width and Height 
  fprintf(pgmimg, "%d %d\n", COLS, ROWS);  

  // Writing the maximum gray value 
  fprintf(pgmimg, "255\n");  
  for (int i = 0; i < ROWS; i++) { 
    for (int j = 0; j < CELLS; j++) { 

      // Writing the gray values in the 2D array to the file 
      fprintf(pgmimg, "%d ", (uint8_t)((image[(i*CELLS)+j] & 0xff000000)>>24)); 
      fprintf(pgmimg, "%d ", (uint8_t)((image[(i*CELLS)+j] & 0x00ff0000)>>16)); 
      fprintf(pgmimg, "%d ", (uint8_t)((image[(i*CELLS)+j] & 0x0000ff00)>>8)); 
      fprintf(pgmimg, "%d ", (uint8_t)((image[(i*CELLS)+j] & 0x000000ff))); 
      /*
         int temp;
         if(j > (CELLS/2))
         {
         temp = 0x99999999;	
         }else{
         temp = 0x33333333;
         }
         fprintf(pgmimg, "%d ", ((temp & 0xff000000)>>24)); 
         fprintf(pgmimg, "%d ", ((temp & 0x00ff0000)>>16)); 
         fprintf(pgmimg, "%d ", ((temp & 0x0000ff00)>>8)); 
         fprintf(pgmimg, "%d ", ((temp & 0x000000ff))); 
         */
    }
    fprintf(pgmimg, "\n"); 
  }   
  fclose(pgmimg); 
}

int initCamera()
{
  int err = writeRegs(startupRegs, sizeof(startupRegs));

  printf("Programming Image Sensor...\n");
  sleep(0.25); //wait for regs to take effect, may not be necessary

  if(err > 0)
  {
    printf("ERROR writeRegs returned error code: %d\n", err); 
    return 1;
  }
  return 0;

}
