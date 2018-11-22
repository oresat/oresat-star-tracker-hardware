/**
  ******************************************************************************
   * @file    OV9655_Camera/src/main.c
  * @author  MCD Application Team
  * @version V1.0.0
  * @date    18-April-2011
  * @brief   Main program body.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; Portions COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 
/**vfv
  ******************************************************************************
  * <h2><center>&copy; Portions COPYRIGHT 2012 Embest Tech. Co., Ltd.</center></h2>
  * @file    main.c 
  * @author  CMP Team
  * @version V1.0.0
  * @date    28-December-2012
  * @brief   Main program body.                        
  *          Modified to support the STM32F4DISCOVERY, STM32F4DIS-BB, STM32F4DIS-CAM
  *          and STM32F4DIS-LCD modules. 
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, Embest SHALL NOT BE HELD LIABLE FOR ANY DIRECT, INDIRECT
  * OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT
  * OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION
  * CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx.h"
#include "stm32f4_discovery.h"
#include "stm32f4_discovery_lcd.h"
#include "stm32f4_discovery_lis302dl.h"
#include "main.h"
//#include "bmp.h"
#include "dcmi_ov9655.h"
#include "USARTprint.h"
#include "stm32f4xx_gpio.h"
#include "stdio.h"
#include "SD.h"

//end for

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define DCMI_DR_ADDRESS     0x50050028
#define FSMC_LCD_ADDRESS    0x60100000


/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t KeyPressFlg = 0;
__IO uint32_t TimingDelay;
RCC_ClocksTypeDef RCC_Clocks;
EXTI_InitTypeDef   EXTI_InitStructure;
uint8_t capture_Flag = ENABLE;
volatile uint8_t sendFlag = DISABLE;

volatile uint16_t intCount = 0; //counts the number of lines/interrupts have fired


/* Private function prototypes -----------------------------------------------*/
uint8_t DCMI_OV9655Config(void);
void DCMI_Config(void);
void I2C1_Config(void);
void EXTILine0_Config(void);

//These will be used when live transfer is implemented
//uint8_t image_buffer1[FRAME_WIDTH / 2] = {0}; //set array size as (FRAME_WIDTH * 2B/pixel) / (4B/word) = 1 line
//uint8_t image_buffer2[FRAME_WIDTH / 2] = {0};
//uint8_t image_buffer3[FRAME_WIDTH / 2] = {0};
//These are temporary, needed for storing entire image on board
uint8_t image_buffer1[FRAME_WIDTH * FRAME_HEIGHT * 2] = {0}; //set array size as (FRAME_WIDTH * 2B/pixel) / (4B/word) = 1 line
uint8_t image_buffer2[FRAME_WIDTH * FRAME_HEIGHT * 2] = {0};
uint8_t image_buffer3[FRAME_WIDTH * FRAME_HEIGHT * 2] = {0};

//temp bufs for saving to SD, these can probably be smaller
uint8_t temp_buf1[1024] = {0};
uint8_t temp_buf2[1024] = {0};

//flags for saving to SD
uint8_t send_SD_1 = 0;
uint8_t send_SD_2 = 0;

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
int main(void)
{
  /*!< At this stage the microcontroller clock setting is already configured, 
       this is done through SystemInit() function which is called from startup
       file (startup_stm32f4xx.s) before to branch to application main.
       To reconfigure the default setting of SystemInit() function, refer to
       system_stm32f4xx.c file
     */
  /* SysTick end of count event each 10ms */
  RCC_GetClocksFreq(&RCC_Clocks);
  SysTick_Config(RCC_Clocks.HCLK_Frequency / 100);

  /* SET USER Key */
  /* Configure EXTI Line0 (connected to PA0 pin) in interrupt mode */
  EXTILine0_Config();

  DCMI_Control_IO_Init();

  init_USART2(230400); // initialize USART2 @ 230400 baud
  //cPrint(bmp_header2[0]);
  //uPrint(USART2, "1");
		   
  if (DCMI_OV9655Config() == 0x00)
  {

    /* Start Image capture */
    /* Enable DMA transfer */
    DMA_Cmd(DMA2_Stream1, ENABLE);

    /* Enable DCMI interface */
    DCMI_Cmd(ENABLE);

    /* Start Image capture */ 
    //DCMI_CaptureCmd(ENABLE);
    DCMI_CaptureCmd(DISABLE);

    /*init the picture count*/
    init_picture_count();

    //init GPIO for debug LEDs
    GPIOinit();
    GPIO_SetBits(GPIOD, GPIO_Pin_13); //Orange LED is status, ON = STANDBY, OFF = BUSY
    GPIO_SetBits(GPIOD, GPIO_Pin_14);

    //GPIO_SetBits(GPIOD, GPIO_Pin_6); //pull this low to enable the camera
    GPIO_ResetBits(GPIOD, GPIO_Pin_6); //enable the camera

    KeyPressFlg = 0;
    while (1)
    {
      /* Insert 200ms delay *///Not sure if this is needed
      Delay(100);
      GPIO_SetBits(GPIOD, GPIO_Pin_14); //LED for debug

      //clear the image buffers
//      for(uint16_t i = 0; i < sizeof(image_buffer1) ; i++)
//      	{
//      		image_buffer1[i] = 0;
//      		image_buffer2[i] = 0;
//      		image_buffer3[i] = 0;
//      	}

      if (KeyPressFlg) {
    	intCount = 0;

    	GPIO_ResetBits(GPIOD, GPIO_Pin_13); //turn off led to show
    	prepareSD(); //get SD ready

    	KeyPressFlg = 0;
        /* press user KEY take a photo */
        if (capture_Flag == ENABLE) {
        	DCMI_CaptureCmd(ENABLE);
        }

        //while(sendFlag == DISABLE) {} //wait for complete flag to be set by interrupt ORIGINAL WORKS!
        //GPIO_SetBits(GPIOD, GPIO_Pin_6); //disable camera
        while(sendFlag == DISABLE)
        {
        	//write to SD when flag is set
        	if(send_SD_1)
        	{
        		saveSDpart(temp_buf2);
        		send_SD_1 = 0; //disable flag
        	}
        	if(send_SD_2)
        	{
        		saveSDpart(temp_buf1);
        		send_SD_2 = 0; //disable flag
        	}
        }

        DCMI_CaptureCmd(DISABLE);
        closeSD(); //finish SD write
        GPIO_SetBits(GPIOD, GPIO_Pin_13);
        //Capture_Image_TO_Bmp;
        //serialImage(); //use this to send over serial
        sendFlag = DISABLE;
      }
    }  
  } else {
	//something went wrong with the camera init, go it infinity
    /* Go to infinite loop */
    while (1);      
  }
}

/**
  * @brief  Configures all needed resources (I2C, DCMI and DMA) to interface with
  *         the OV9655 camera module
  * @param  None
  * @retval 0x00 Camera module configured correctly 
  *         0xFF Camera module configuration failed
  */
uint8_t DCMI_OV9655Config(void)
{
  //for some reason this camera needs this, otherwise it fails to init
  Delay(1);

  /* I2C1 will be used for OV9655 camera configuration */
  I2C1_Config();

  /* Reset and check the presence of the OV9655 camera module */
  if (DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS,0x12, 0x80))
  {
     return (0xFF);
  }

  /* OV9655 Camera size setup */
  //DCMI_OV9655_QVGASizeSetup();
  DCMI_OV9655_QQVGASizeSetup();

//  /* Set the RGB565 mode */
//  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM7, 0x63);
//  Delay(2);
//  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM15, 0x10);
//  Delay(2);

  /* Set the color space mode */
  //DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM7, 0x62); //YUV
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM7, 0x63 ); //RGB raw
  Delay(2);
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM15, 0x10);
  Delay(2);
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0x3A, 0xCC); //TSLB 0x3A, original 0xCC
  Delay(2);

  /* Invert the HRef signal*/
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, OV9655_COM10, 0x08);
  Delay(2);

  /*Below is Oliver's Experimental Settings. All original settings are still set
  before this, so just comment out below for original*/

  //COM8, turn off AEC (0xC6), original: 0xC7,
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0x13, 0xC7);
  Delay(2);


  //This should be the highest exposure but it doesn't appear washed out?
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0x10, 0x00); //AEC Middle 8 bits, default: 0x40
  Delay(2);
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0xA1, 0x41); //AECH High bits [5:0], default: 0x40
  Delay(2);

//  //lowest exposure
//  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0x10, 0x00); //AEC Middle 8 bits, default: 0x40
//  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0xA1, 0x40); //AECH High bits [5:0], default: 0x40
//

  //0x3F = 187.5 KHz
  DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS, 0x11, 0x3F); //change clock prescaler, original = 0x01
  Delay(2);

  //below is settings I tried with no effect
  //COM5, Bit[0] = enable/disable Exposure Step Control, original 0x61
  //DCMI_SingleRandomWrite(OV9655_DEVICE_WRITE_ADDRESS,0x0e, 0x61);
  //Delay(2);

  /* Configure the DCMI to interface with the OV9655 camera module */


  /* When Clock Prescaler is set to external 0x11 0x20, the exposure settings have a much greater effect?
   *
   *
   *
   *
   */
  DCMI_Config();
  
  return (0x00);
}

/**
  * @brief  Configures the I2C1 used for OV9655 camera module configuration.
  * @param  None
  * @retval None
  */
void I2C1_Config(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  I2C_InitTypeDef  I2C_InitStruct;

 /* I2C1 clock enable */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);
  /* GPIOB clock enable */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE); 

  /* Connect I2C1 pins to AF4 ************************************************/
  GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_I2C1);
  GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_I2C1);  
  
  /* Configure I2C1 GPIOs *****************************************************/  
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8 | GPIO_Pin_9;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;   
  GPIO_Init(GPIOB, &GPIO_InitStructure);

  /* Configure I2C1 ***********************************************************/  
  /* I2C DeInit */   
  I2C_DeInit(I2C1);
    
  /* Enable the I2C peripheral */
  I2C_Cmd(I2C1, ENABLE);
 
  /* Set the I2C structure parameters */
  I2C_InitStruct.I2C_Mode = I2C_Mode_I2C;
  I2C_InitStruct.I2C_DutyCycle = I2C_DutyCycle_2;
  I2C_InitStruct.I2C_OwnAddress1 = 0xFE;
  I2C_InitStruct.I2C_Ack = I2C_Ack_Enable;
  I2C_InitStruct.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
  I2C_InitStruct.I2C_ClockSpeed = 30000;
  
  /* Initialize the I2C peripheral w/ selected parameters */
  I2C_Init(I2C1, &I2C_InitStruct);
}

/**
  * @brief  Configures the DCMI to interface with the OV9655 camera module.
  * @param  None
  * @retval None
  */
void DCMI_Config(void)
{
	DCMI_InitTypeDef DCMI_InitStructure;
	GPIO_InitTypeDef GPIO_InitStructure;
	DMA_InitTypeDef  DMA_InitStructure;

	/* Enable DCMI GPIOs clocks */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC | RCC_AHB1Periph_GPIOE |
						 RCC_AHB1Periph_GPIOB | RCC_AHB1Periph_GPIOA, ENABLE);

	/* Enable DCMI clock */
	RCC_AHB2PeriphClockCmd(RCC_AHB2Periph_DCMI, ENABLE);

	/* Connect DCMI pins to AF13 ************************************************/
	/* PCLK */
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_DCMI);
	/* D0-D7 */
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource6, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource7, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOE, GPIO_PinSource0, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOE, GPIO_PinSource1, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOE, GPIO_PinSource4, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOE, GPIO_PinSource5, GPIO_AF_DCMI);
	GPIO_PinAFConfig(GPIOE, GPIO_PinSource6, GPIO_AF_DCMI);
	/* VSYNC */
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource7, GPIO_AF_DCMI);
	/* HSYNC */
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource4, GPIO_AF_DCMI);

	/* DCMI GPIO configuration **************************************************/
	/* D0 D1(PC6/7) */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP ;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	/* D2..D4(PE0/1/4) D6/D7(PE5/6) */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1
								  | GPIO_Pin_4 | GPIO_Pin_5 | GPIO_Pin_6;
	GPIO_Init(GPIOE, &GPIO_InitStructure);

	/* D5(PB6), VSYNC(PB7) */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_7;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	/* PCLK(PA6) HSYNC(PA4)*/
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4 | GPIO_Pin_6;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	/* DCMI configuration *******************************************************/
	//DCMI_InitStructure.DCMI_CaptureMode = DCMI_CaptureMode_Continuous;
	DCMI_InitStructure.DCMI_CaptureMode = DCMI_CaptureMode_SnapShot;
	DCMI_InitStructure.DCMI_SynchroMode = DCMI_SynchroMode_Hardware;
	DCMI_InitStructure.DCMI_PCKPolarity = DCMI_PCKPolarity_Falling;
	DCMI_InitStructure.DCMI_VSPolarity = DCMI_VSPolarity_High;
	DCMI_InitStructure.DCMI_HSPolarity = DCMI_HSPolarity_High;
	DCMI_InitStructure.DCMI_CaptureRate = DCMI_CaptureRate_All_Frame;
	DCMI_InitStructure.DCMI_ExtendedDataMode = DCMI_ExtendedDataMode_8b;

	DCMI_Init(&DCMI_InitStructure);

	/* Configures the DMA2 to transfer Data from DCMI to the LCD ****************/
	/* Enable DMA2 clock */
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);

	/* DMA2 Stream1 Configuration */
	DMA_DeInit(DMA2_Stream1);

	DMA_InitStructure.DMA_Channel = DMA_Channel_1;
	DMA_InitStructure.DMA_PeripheralBaseAddr = DCMI_DR_ADDRESS;
	DMA_InitStructure.DMA_Memory0BaseAddr = image_buffer1; //array name is pointer to mem location
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
	DMA_InitStructure.DMA_BufferSize = FRAME_WIDTH / 2; // buffer (FRAME_WIDTH * 2B/pixel) / (4B/word) = 1 line
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Word; //this must be WORD
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord; //this seems to work with any size
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
	DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Enable;
	DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_Full;
	DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
	DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;

	//Double Buffer Config
	//set 2nd mem address as second line in buffer: this won't be necessary for bigger images
	DMA_DoubleBufferModeConfig(DMA2_Stream1, &image_buffer2[FRAME_WIDTH * 2], DMA_Memory_0); //set 2nd mem address as second line in buffer
	DMA_DoubleBufferModeCmd (DMA2_Stream1, ENABLE);

	DMA_ITConfig(DMA2_Stream1, DMA_IT_TC, ENABLE); // Enable DMA2 Transfer Complete interrupt

	DMA_Init(DMA2_Stream1, &DMA_InitStructure);

	NVIC_InitTypeDef NVIC_InitStructure;

    //Enable DMA channel IRQ Channel TX */
    NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream1_IRQn;

    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;

    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;

    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;

    NVIC_Init(&NVIC_InitStructure);

}

//DMA transfer complete interrupt: runs after every line has been transferred to memory.
//Double buffers and increments the DMA address
void DMA2_Stream1_IRQHandler(void)
{
	intCount++;
	GPIO_ResetBits(GPIOD, GPIO_Pin_14); //LED for debug
	DMA_ClearITPendingBit(DMA2_Stream1, DMA_IT_TCIF1); //clear the transfer complete flag
	//DCMI_CaptureCmd(DISABLE);

	if(DMA_GetCurrentMemoryTarget(DMA2_Stream1) == 1) //if writing to mem1, reassign mem0 address
	{
		//assign new mem0 address and increment by (# of interrupts + 1) * (frame width * 2)
		//DMA2_Stream1->M0AR = &image_buffer1[(intCount + 1) * (FRAME_WIDTH * 2)];
		DMA2_Stream1->M0AR = &temp_buf1;
		GPIO_ResetBits(GPIOD, GPIO_Pin_14); //LED for debug
		send_SD_1 = 1; //set send_SD_1 to positive int count
	}else ///if writing to mem0, reassign mem1 address
	{
		//assign new mem1 address and increment by (# of interrupts + 1) * (frame width * 2)
		//DMA2_Stream1->M1AR = &image_buffer2[(intCount + 1) * (FRAME_WIDTH * 2)];
		DMA2_Stream1->M1AR = &temp_buf2;
		GPIO_SetBits(GPIOD, GPIO_Pin_14); //LED for debug
		send_SD_2 = 1; //set send_SD_1 to positive int count
	}

	if(intCount >= FRAME_HEIGHT) //when max lines has been read, ready the serial transmission
	{
		GPIO_ResetBits(GPIOD, GPIO_Pin_14);
		sendFlag = ENABLE; //set serial transmission flag
	}
}

/**
  * @brief  Configures EXTI Line0 (connected to PA0 pin) in interrupt mode
  * @param  None
  * @retval None
  */
void EXTILine0_Config(void)
{
  
  GPIO_InitTypeDef   GPIO_InitStructure;
  NVIC_InitTypeDef   NVIC_InitStructure;

  /* Enable GPIOA clock */
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
  /* Enable SYSCFG clock */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
  
  /* Configure PA0 pin as input floating */
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* Connect EXTI Line0 to PA0 pin */
  SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOA, EXTI_PinSource0);

  /* Configure EXTI Line0 */
  EXTI_InitStructure.EXTI_Line = EXTI_Line0;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling;  
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure);

  /* Enable and set EXTI Line0 Interrupt to the lowest priority */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI0_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x01;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x01;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}

void GPIOinit()
{
	GPIO_InitTypeDef GPIO_InitStruct;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE); //init gpio clock

	GPIO_InitStruct.GPIO_Pin = GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_6 | GPIO_Pin_15; // configure LED GPIO pins
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT; 		// we want the pins to be an output
	GPIO_InitStruct.GPIO_Speed = GPIO_Speed_2MHz; 	// this sets the GPIO modules clock speed
	GPIO_InitStruct.GPIO_OType = GPIO_OType_PP; 	// this sets the pin type to push / pull (as opposed to open drain)
	GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; 	// this sets the pullup / pulldown resistors to be inactive
	GPIO_Init(GPIOD, &GPIO_InitStruct); 			// this finally passes all the values to the GPIO_Init function which takes care of setting the corresponding bits.

}

/**
  * @brief  Inserts a delay time.
  * @param  nTime: specifies the delay time length, in milliseconds
  * @retval None
  */
void Delay(uint32_t nTime)
{
  TimingDelay = nTime;

  while (TimingDelay != 0);

}

/**

  * @brief  Decrements the TimingDelay variable.
  * @param  None
  * @retval None
  */
void TimingDelay_Decrement(void)
{
  if (TimingDelay != 0x00)
  { 
    TimingDelay--;
  }
}

void serialImage()
{

//	for(uint16_t i = 0; i < sizeof(bmp_header2) ; i++)
//	{
//		Delay(1);
//		cPrint(bmp_header2[i]);
//	}
	Delay(1);

	//combined buffers
	for(uint16_t j = 0 ; j < FRAME_HEIGHT ; j++) //loop through each line
	{
		for(uint16_t y = 0 ; y < (FRAME_WIDTH * 2) ; y++) //loop through each 2 byte pixel in row
		{
			if(j % 2) //if odd line j % 2
			{
				image_buffer3[(j * (FRAME_WIDTH * 2)) + y] = image_buffer2[(j * (FRAME_WIDTH * 2)) + y];
				//image_buffer3[y] = image_buffer[y];
			}else
			{
				image_buffer3[(j * (FRAME_WIDTH * 2)) + y] = image_buffer1[(j * (FRAME_WIDTH * 2)) + y];
				//image_buffer3[y] = image_buffer2[y];
			}
		}
	}

	prepareSD();
	uint8_t tempbuf[1024] = {0};
	for (uint8_t j = 0 ; j < FRAME_HEIGHT ; j++)
	{
		for(uint16_t i=0 ; i<(FRAME_WIDTH*2) ; i++)
		{
			tempbuf[i] = image_buffer3[(j*FRAME_WIDTH*2) + i];
		}
		saveSDpart(tempbuf);
	}
	//saveSD();
	closeSD();


	//send combined buffer
//	for(uint32_t z = 0 ; z < (FRAME_HEIGHT * FRAME_WIDTH * 2) ; z++)
//	{
//		cPrint(image_buffer3[z]);
//	}
	//Capture_Image_TO_Bmp();
	//prepareSD();
	//saveSD();
	//closeSD();



	//Write to SD stuff End

}
