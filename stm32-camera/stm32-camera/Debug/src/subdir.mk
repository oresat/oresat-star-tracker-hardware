################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/bmp.c \
../src/dcmi_ov9655.c \
../src/main.c \
../src/stm32f4xx_it.c \
../src/system_stm32f4xx.c 

OBJS += \
./src/bmp.o \
./src/dcmi_ov9655.o \
./src/main.o \
./src/stm32f4xx_it.o \
./src/system_stm32f4xx.o 

C_DEPS += \
./src/bmp.d \
./src/dcmi_ov9655.d \
./src/main.d \
./src/stm32f4xx_it.d \
./src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F407VGTx -DSTM32F4DISCOVERY -DDEBUG -I"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\inc" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\misc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_adc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_can.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_crc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_cryp.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_dac.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_dbgmcu.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_dcmi.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_dma.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_exti.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_flash.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_fsmc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_gpio.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_hash.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_i2c.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_iwdg.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_pwr.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_rcc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_rng.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_rtc.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_sdio.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_spi.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_syscfg.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_tim.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_usart.h" -include"C:\Users\Oliver\Documents\SWSTM32_workspace\stm32-camera\STM32F4xx_StdPeriph_Driver\inc\stm32f4xx_wwdg.h" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


