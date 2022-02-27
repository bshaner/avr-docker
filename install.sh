#! /bin/bash

### BSD 3-Clause License
###
### Copyright (c) 2019, Łukasz Podkalicki
### Copyright (c) 2022, Bowen Shaner
### All rights reserved.
###
### Redistribution and use in source and binary forms, with or without
### modification, are permitted provided that the following conditions are met:
###
### 1. Redistributions of source code must retain the above copyright notice, this
###    list of conditions and the following disclaimer.
###
### 2. Redistributions in binary form must reproduce the above copyright notice,
###    this list of conditions and the following disclaimer in the documentation
###    and/or other materials provided with the distribution.
###
### 3. Neither the name of the copyright holder nor the names of its
###    contributors may be used to endorse or promote products derived from
###    this software without specific prior written permission.
###
### THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
### AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
### IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
### DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
### FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
### DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
### SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
### CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
### OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
### OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Create helper command for toolchain docker image
[ -z ${TOOLCHAIN_IMAGE} ] && TOOLCHAIN_IMAGE=bshaner/avr-toolchain
TOOLCHAIN_SCRIPT=avr-toolchain

cat <<EOF > /tmp/${TOOLCHAIN_SCRIPT}.tmp
#!/bin/bash
docker run --rm --privileged -v \$(pwd):/build ${TOOLCHAIN_IMAGE} "\$@"
EOF

chmod ugo+x /tmp/${TOOLCHAIN_SCRIPT}.tmp
sudo mv /tmp/${TOOLCHAIN_SCRIPT}.tmp /usr/bin/${TOOLCHAIN_SCRIPT}


# Create helper command for simulate/debug docker image
[ -z ${DEBUG_IMAGE} ] && DEBUG_IMAGE=bshaner/avr-simulate-debug
DEBUG_SCRIPT=avr-debug

cat <<EOF > /tmp/${DEBUG_SCRIPT}.tmp
#!/bin/bash
docker run --rm --privileged -v \$(pwd):/build ${DEBUG_IMAGE} "\$@"
EOF

chmod ugo+x /tmp/${DEBUG_SCRIPT}.tmp
sudo mv /tmp/${DEBUG_SCRIPT}.tmp /usr/bin/${DEBUG_SCRIPT}