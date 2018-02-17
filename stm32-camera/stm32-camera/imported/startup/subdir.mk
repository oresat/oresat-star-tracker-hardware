################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../startup/startup_stm32.s 

C_SRCS += \
../startup/sysmem.c 

OBJS += \
./startup/startup_stm32.o \
./startup/sysmem.o 

C_DEPS += \
./startup/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/STM32F4xx_StdPeriph_Driver/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/Utilities/STM32F4-Discovery" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Include" -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

startup/%.o: ../startup/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DSTM32 -DSTM32F4 -DSTM32F407VGTx -DSTM32F4DISCOVERY -DDEBUG -DSTM32F40XX -DSTM32F40_41xxx -DUSE_STDPERIPH_DRIVER -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/imported/Utilities" -Iinc -ISTM32F4xx_StdPeriph_Driver/inc -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/Utilities/FatFs_vR0.08a" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/STM32F4xx_StdPeriph_Driver/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/Utilities/STM32F4-Discovery" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Include" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/Device/ST/STM32F4xx/Include" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/inc" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/device" -I"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/CMSIS/core"  -include"C:/Users/Oliver/Documents/SWSTM32_workspace/stm32-camera/STM32F4xx_StdPeriph_Driver/inc/stm32f4xx_gpio.h" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


