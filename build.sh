#! /bin/bash

# pull source to build avr-gdb
AVR_GCC_HASH=3211da908d3fb67c91afd812a052aa77e1cd5ed3
if [ ! -d build-avr-gcc ]; then
    wget -O ${AVR_GCC_HASH}.tar.gz https://github.com/igormiktor/build-avr-gcc/archive/${AVR_GCC_HASH}.tar.gz
    tar -zxf ${AVR_GCC_HASH}.tar.gz
    mv build-avr-gcc*/ build-avr-gcc
    rm ${AVR_GCC_HASH}.tar.gz
fi

docker build . -f alpine.Dockerfile --tag bshaner/avr-toolchain "$@"

# Ubuntu image is much bigger, but can easily install any of the tools
#   * using ubuntu image alongside for debugging, not sure if its needed in the end?
docker build . -f ubuntu.Dockerfile --tag bshaner/avr-simulate-debug "$@"
