#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TARGET_ARCH=qemux86-64

source $SCRIPT_DIR/qemu-shell.sh
runqemu ${TARGET_ARCH} nographic
