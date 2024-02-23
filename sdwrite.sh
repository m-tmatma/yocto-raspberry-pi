#!/bin/sh

USBDEV=$1
if [ -z "$USBDEV" ]; then
  USBDEV=$(ls /sys/block/ -1 | \
    xargs -I{} echo /sys/block/{} | \
    xargs readlink | \
    grep usb | sed -e 's!.*/\([a-z]\+\)!\1!')
fi

if [ -z "$USBDEV" ]; then
    echo "not found usb device"
    exit 1
fi
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $SCRIPT_DIR/container/home/yocto/setting.sh

INFILE=./container/home/yocto/$BUILD_DIR/tmp/deploy/images/raspberrypi5/custom-test-image-raspberrypi5.wic.bz2
sudo umount ${USBDEV}?
lsblk
bzcat ${INFILE} | sudo dd of=${USBDEV} status=progress
