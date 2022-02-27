
FROM lpodkalicki/avr-toolchain

# simavr
#   * simavr is only available on edge/testing, not main
RUN apk add simavr --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# gdbavr (TODO: alpine uncooperative, needs interactive mode )
#   * sed is required since sudo isn't available on alpine
#   * sh explicit over bash in shebang also because of alpine
COPY build-avr-gcc/avr-file-names build-avr-gcc/build-avr-gdb /tools/
RUN cd /tools \
    && apk --no-cache add gcc g++ musl-dev texinfo \
    && sed -i 's/sudo //g' build-avr-gdb \
    && sh ./build-avr-gdb \
    && cp gdb*_bld/gdb/gdb /usr/bin/
