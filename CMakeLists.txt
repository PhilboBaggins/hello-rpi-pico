cmake_minimum_required(VERSION 3.13...3.27)

# initialize the SDK based on PICO_SDK_PATH
# note: this must happen before project()
include(pico_sdk_import.cmake)

project(hello-rpi-pico)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

add_executable(hello-rpi-pico
    hello-rpi-pico.c
)

pico_enable_stdio_uart(hello-rpi-pico 1)
pico_enable_stdio_usb(hello-rpi-pico 0)

target_link_libraries(hello-rpi-pico
    pico_stdlib
)

pico_add_extra_outputs(hello-rpi-pico)
