################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Utilities/FatFs_vR0.08a/diskio.c \
../Utilities/FatFs_vR0.08a/ff.c 

OBJS += \
./Utilities/FatFs_vR0.08a/diskio.o \
./Utilities/FatFs_vR0.08a/ff.o 

C_DEPS += \
./Utilities/FatFs_vR0.08a/diskio.d \
./Utilities/FatFs_vR0.08a/ff.d 


# Each subdirectory must supply rules for building sources it contributes
Utilities/FatFs_vR0.08a/%.o: ../Utilities/FatFs_vR0.08a/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F407VGTx -DSTM32F4DISCOVERY -DDEBUG -DSTM32F40XX -DSTM32F40_41xxx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/inc" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/Utilities/FatFs_vR0.08a" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/STM32F4xx_StdPeriph_Driver/inc" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/Utilities/STM32F4-Discovery" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/CMSIS/Include" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/CMSIS/Device/ST/STM32F4xx/Include" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


