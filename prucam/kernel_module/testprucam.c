#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include "camera-i2c.h"
#include "regs.h"
#include <sys/time.h>

#define ROWS 960
#define COLS 1280
#define PIXELS ROWS * COLS
#define IMGFILE "capture.pgm"

int initCamera(void);
void writeImageFile(char* buf);

int main(){
  int ret, fd;

  //program camera via i2c
  ret = initCamera();
  if(ret < 0) {
    printf("error programming camera, error code: %d\n", ret);
    return ret;
  }

  struct timeval before, after;

  printf("Starting device test code example...\n");
  fd = open("/dev/prucam", O_RDWR);             // Open the device with read/write access
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

  writeImageFile(buf);

  return 0;
}

//initCamera programs the camera via i2c
int initCamera()
{
  printf("Programming Image Sensor...\n");

  int err = writeRegs(startupRegs, sizeof(startupRegs));

  sleep(0.25); //wait for regs to take effect, may not be necessary

  if(err > 0)
  {
    printf("ERROR writeRegs returned error code: %d\n", err);
    return err;
  }
  return 0;
}

//writeImageFile writes the char buffer to a PGM type image
void writeImageFile(char* buf) {
  printf("Writing to '%s'\n", IMGFILE);
  FILE* pgmimg; 
  pgmimg = fopen(IMGFILE, "wb"); 

  // Write Magic Number to the File 
  fprintf(pgmimg, "P2\n");  

  // Write Width and Height 
  fprintf(pgmimg, "%d %d\n", COLS, ROWS);  

  // Writing the maximum gray value 
  fprintf(pgmimg, "255\n");  
  for (int i = 0; i < ROWS; i++) { 
    for (int j = 0; j < COLS; j++) { 
      fprintf(pgmimg, "%d ", (uint8_t)(buf[(i*COLS)+j])); 
    }
    fprintf(pgmimg, "\n"); 
  }   

  fclose(pgmimg); 
}
