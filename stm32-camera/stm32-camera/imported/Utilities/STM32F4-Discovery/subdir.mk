################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/STM32F4-Discovery/fonts.c \
../Utilities/STM32F4-Discovery/lcd_log.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery_audio_codec.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery_debug.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery_lcd.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery_lis302dl.c \
../Utilities/STM32F4-Discovery/stm32f4_discovery_sdio_sd.c 

OBJS += \
./Utilities/STM32F4-Discovery/fonts.o \
./Utilities/STM32F4-Discovery/lcd_log.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery_audio_codec.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery_debug.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery_lcd.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery_lis302dl.o \
./Utilities/STM32F4-Discovery/stm32f4_discovery_sdio_sd.o 

C_DEPS += \
./Utilities/STM32F4-Discovery/fonts.d \
./Utilities/STM32F4-Discovery/lcd_log.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery_audio_codec.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery_debug.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery_lcd.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery_lis302dl.d \
./Utilities/STM32F4-Discovery/stm32f4_discovery_sdio_sd.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/STM32F4-Discovery/%.o: ../Utilities/STM32F4-Discovery/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F407VGTx -DSTM32F4DISCOVERY -DDEBUG -DSTM32F40XX -DSTM32F40_41xxx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/imported/Utilities" -Iinc -ISTM32F4xx_StdPeriph_Driver/inc -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/Utilities/FatFs_vR0.08a" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/STM32F4xx_StdPeriph_Driver/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/Utilities/STM32F4-Discovery" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Include" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/device" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/core"  -include"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


