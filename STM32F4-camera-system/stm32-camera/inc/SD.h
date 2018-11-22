#include "stdio.h"
#include "ff.h"

void save_SD();
static int32_t get_pic_count(void);

FATFS filesys;        /* volume label */

/* save the picture count  */
//uint32_t pic_counter2 = 0;

