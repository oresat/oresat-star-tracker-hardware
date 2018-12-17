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
#include <stdint.h>
#include "camera-i2c.h"
#include "regs.h"

int initCamera();

//this is arbitray and unsafe until I reserve this memory somehow
//#define PRU_BASE_ADDR 0x4a300000
#define PRU_BASE_ADDR 0x90000000
//#define PRU_BASE_ADDR 0x9c800000
#define STATUS 0x1000
#define BUF0  (PRU_BASE_ADDR + 0x00002000)
#define BUF1  (PRU_BASE_ADDR + 0x00003000)
#define STATUS_MEM (PRU_BASE_ADDR + STATUS)

#define ARM_2_PRU 0x01
#define PRU_2_ARM 0x02
#define END	  0x08

//Buffer Flag. 0 = buf0, 1 = buf1
#define BUF 0x04

#define ROWS 960  //rows per image
#define COLS 1280 //pixels per row
#define CELLS COLS/4 //a cell is a 32 bit word hold 4 byte sized pixels

#define IMGFILE "capture.pgm"
