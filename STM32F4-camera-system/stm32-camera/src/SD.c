#include "SD.h"
#include <string.h>
#include "ff.h"
#include "main.h"
#include "stdio.h"

uint8_t bmp_header2[70] = {
  0x42, 0x4D, 0x46, 0x96, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x28, 0x00,
  0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x01, 0x00, 0x10, 0x00, 0x03, 0x00,
  0x00, 0x00, 0x00, 0x58, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x00, 0x00, 0xE0, 0x07, 0x00, 0x00, 0x1F, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

uint32_t pic_counter = 0;

int32_t  ret = -1;
int32_t  i = 0;
int32_t  j = 0;
int16_t  data_temp = 0;
uint32_t bw = 0;

char  file_str[30] = {0};
FIL file;        /* File object */

void prepareSD()
{
	/* mount the filesys */
	if (f_mount(0, &filesys) != FR_OK) {
		cPrint("1");
	//return -1;
	}
	Delay(10);

	sprintf(file_str, "pic%d.bmp",pic_counter);

	ret = f_open(&file, file_str, FA_WRITE | FA_CREATE_ALWAYS);

	/* write the bmp header */
	ret = f_write(&file, bmp_header2, 70, &bw);
}
void saveSDpart(uint8_t buffer[])
{
	ret = f_write(&file, buffer, FRAME_WIDTH * 2, &bw);
}

void saveSD()
{
	//Write to SD stuff Start. Just copied and pasted Capture_Image_TO_Bmp();

	  //16-bit BMP = RRRRR-GGGGG-BBBBB-A
	  uint16_t k = 0;
	  uint8_t image_buf[1024] = {0};
	  for (j = 0; j < FRAME_HEIGHT; j++) {
		  //cPrint("2");
		  //uint16_t k = 0;
	    for(i=0;i<FRAME_WIDTH;i++) {
	    	//image_buffer[k*2+0] = 0xF8; //write all red frame
	    	//image_buffer[k*2+1] = 0x00;
	    	image_buf[i*2+1] = image_buffer3[k*2+1];
	    	image_buf[i*2+0] = image_buffer3[k*2+0];

	    	k++;
	    }
	    ret = f_write(&file, image_buf, FRAME_WIDTH * 2, &bw);
	  }


}

void closeSD()
{
	ret = f_close(&file);

	f_mount(0, NULL);

	/* statistics the take pictures count */
	pic_counter++;
	//set_pic_count();
}

void init_picture_count(void)
{
  pic_counter = get_pic_count();
}


/**
  * @brief  get the bmp picture count
  * @param  None
  * @retval int32_t : picture count
  */
static int32_t get_pic_count(void)
{
  int32_t ret = -1;
  uint32_t bw = 0;
  FIL file;

  /* mount the filesys */
  if (f_mount(0, &filesys) != FR_OK) {
    return -1;
  }
  Delay(10);

  ret = f_open(&file, "counter.dat", FA_OPEN_EXISTING | FA_READ);
  if (ret != FR_OK) {
    f_close(&file);
    ret = f_open(&file,"counter.dat", FA_CREATE_ALWAYS | FA_WRITE);
    if (ret == FR_OK) {
      pic_counter = 0;
      ret = f_write(&file, &pic_counter, sizeof(uint32_t), &bw);
      f_close(&file);
      f_mount(0, NULL);
      return pic_counter;
    } else {
      f_close(&file);
      f_mount(0, NULL);
      return -1;
    }
  } else {
    ret = f_read(&file, &pic_counter, sizeof(uint32_t), &bw);
    f_close(&file);
    f_mount(0, NULL);
    return pic_counter;
  }
}
