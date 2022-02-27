# avr-docker
A parent build environment for AVR projects build/simulate


## Recognition
Install script are adapted from [lpodkalicki/avr-toolchain-docker](https://github.com/lpodkalicki/avr-toolchain-docker)
* simavr is not very alpine friendly

## Examples
```sh
$ cd your-project/
$ avr-toolchain avr-gcc --version
$ avr-toolchain make -version
$ avr-toolchain avrdude --help
$ avr-toolchain cmake -version
$ avr-toolchain make
$ avr-toolchain flash
$ avr-toolchain simavr -h
$ avr-toolchain avr-gdb -v

$ avr-toolchain simavr tests/attiny85_example.axf
```