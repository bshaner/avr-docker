FROM ubuntu:latest

WORKDIR /tools

RUN apt update \
    && apt-get install make cmake avrdude avr-libc gcc-avr simavr gdb-avr -y

WORKDIR /build