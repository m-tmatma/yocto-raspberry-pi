#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

TARGET_ARCH=qemux86-64
source $SCRIPT_DIR/poky/oe-init-build-env $SCRIPT_DIR/build-qemu

