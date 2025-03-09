cmake_minimum_required(VERSION 3.15.3)

project(example_1_led_blink)

enable_language(C ASM)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)s

set(STM32CUBEMX_GENERATED_FILES 

    Src/main.c
    Src/gpio.c
    Src/icache.c
    Src/memorymap.c
    Src/stm32wbaxx_it.c
    Src/stm32wbaxx_hal_msp.c

    Drivers/BSP/STM32WBAxx_Nucleo/stm32wbaxx_nucleo.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_cortex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_icache.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_rcc.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_rcc_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_flash.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_flash_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_gpio.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_dma.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_dma_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_exti.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_pwr.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_pwr_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_tim.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_tim_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_usart.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_usart_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_uart_ex.c
    Drivers/STM32WBAxx_HAL_Driver/Src/stm32wbaxx_hal_uart.c

    Src/system_stm32wbaxx.c
    Src/sysmem.c
    Src/syscalls.c  

    startup_stm32wba52xx.s)

# set the name of the executable
set(EXECUTABLE ${PROJECT_NAME}.out)

# add_executable command is used to define an executable target for the build system.
add_executable(${EXECUTABLE} ${STM32CUBEMX_GENERATED_FILES})

--------------- CONTINUAR AQUI -------------------


target_compile_definitions(${EXECUTABLE} PRIVATE
        -DUSE_HAL_DRIVER
        -DSTM32F413xx
        )

target_include_directories(${EXECUTABLE} PRIVATE
        BSP/Inc
        BSP/Drivers/STM32F4xx_HAL_Driver/Inc
        BSP/Drivers/CMSIS/Device/ST/STM32F4xx/Include
        BSP/Drivers/CMSIS/Include
        )

target_compile_options(${EXECUTABLE} PRIVATE
        -mcpu=cortex-m4
        -mthumb
        -mfpu=fpv4-sp-d16
        -mfloat-abi=hard

        -fdata-sections
        -ffunction-sections

        -Wall

        $<$<CONFIG:Debug>:-Og>
        )

target_link_options(${EXECUTABLE} PRIVATE
        -T${CMAKE_SOURCE_DIR}/BSP/STM32F413ZHTx_FLASH.ld
        -mcpu=cortex-m4
        -mthumb
        -mfpu=fpv4-sp-d16
        -mfloat-abi=hard
        -specs=nano.specs
        -lc
        -lm
        -lnosys
        -Wl,-Map=${PROJECT_NAME}.map,--cref
        -Wl,--gc-sections
        )

# Print executable size
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND arm-none-eabi-size ${EXECUTABLE})

# Create hex file
add_custom_command(TARGET ${EXECUTABLE}
        POST_BUILD
        COMMAND arm-none-eabi-objcopy -O ihex ${EXECUTABLE} ${PROJECT_NAME}.hex
        COMMAND arm-none-eabi-objcopy -O binary ${EXECUTABLE} ${PROJECT_NAME}.bin)
