#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>
#include "qdbmp.h"
#include "camera-i2c.h"
#include "regs.h"

#define ROWS 960
#define COLS 1280
#define PIXELS ROWS * COLS
#define IMGFILE "capture.pgm"

int initCamera(void);
void writePgmFile(char* buf);

int main(){
  int ret, fd;

  
 /* 
  //program camera via i2c
  ret = initCamera();
  if(ret < 0) {
  printf("error programming camera, error code: %d\n", ret);
  return ret;
  }
  

  return;
  */

  //for(int i = 0 ; i < 9999999 ; i++) {
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

  //writePgmFile(buf);
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
  //}

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
void writePgmFile(char* buf) {
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
