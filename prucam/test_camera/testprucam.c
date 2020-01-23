#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>
#include "qdbmp.h"

#define ROWS 960
#define COLS 1280
#define PIXELS ROWS * COLS

int main(){
  int ret, fd;

  struct timeval before, after;

  printf("Starting device test code example...\n");
  fd = open("/dev/prucam", O_RDONLY|O_LARGEFILE|O_CLOEXEC);             // Open the device with read/write access
  //fd = open("/dev/prucam", O_RDWR);             // Open the device with read/write access
  if (fd < 0){
    perror("Failed to open the device...");
    return errno;
  }

  char buf[PIXELS];

  gettimeofday(&before , NULL);

  printf("Reading from the device...\n");
  ret = read(fd, buf, PIXELS);        // Read the response from the LKM
  if (ret < 0){
    perror("Failed to read the message from the device.");
    return errno;
  }

  gettimeofday(&after , NULL);

  long uSecs = after.tv_usec - before.tv_usec;

  if(uSecs < 0) //occaisionally this number is 1000000 off??
    uSecs += 1000000;

  printf("Elapsed time: %ld uSec\n", uSecs);

  BMP* bmp;
  bmp = BMP_Create(COLS, ROWS, 8);

  //we have to create an 8 bit color palette in the BMP library
  for (int i=0; i<256; i++)
    BMP_SetPaletteColor(bmp, i, i,i,i);

  //write buffer to image
  for(int i = 0 ; i < ROWS ; i++) 
    for(int j = 0 ; j < COLS ; j++) 
      BMP_SetPixelIndex(bmp, j, i, buf[(i*COLS) + j]);

  //save image
  char name[20];
  sprintf(name, "capture_%03d.bmp", 1);
  BMP_WriteFile(bmp, name);
  BMP_CHECK_ERROR( stderr, -2 );
  BMP_Free(bmp);

  ret = close(fd);
  if(ret != 0) {
    perror("error closing device");
    return ret;
  }

  return 0;
}

