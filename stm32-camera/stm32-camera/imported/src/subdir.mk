################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/USARTprint.c \
../src/bmp.c \
../src/dcmi_ov9655.c \
../src/main.c \
../src/stm32f4xx_it.c \
../src/system_stm32f4xx.c 

OBJS += \
./src/USARTprint.o \
./src/bmp.o \
./src/dcmi_ov9655.o \
./src/main.o \
./src/stm32f4xx_it.o \
./src/system_stm32f4xx.o 

C_DEPS += \
./src/USARTprint.d \
./src/bmp.d \
./src/dcmi_ov9655.d \
./src/main.d \
./src/stm32f4xx_it.d \
./src/system_stm32f4xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F407VGTx -DSTM32F4DISCOVERY -DDEBUG -DSTM32F40XX -DSTM32F40_41xxx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/inc" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/Utilities/FatFs_vR0.08a" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/STM32F4xx_StdPeriph_Driver/inc" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/Utilities/STM32F4-Discovery" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/CMSIS/Include" -I"C:/Users/Oliver/Documents/GitHub/oresat-star-tracker/stm32-camera/stm32-camera/CMSIS/Device/ST/STM32F4xx/Include" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


