#!/bin/sh

USBDEV=$(ls /sys/block/ -1 | \
  xargs -I{} echo /sys/block/{} | \
  xargs readlink | \
  grep usb | sed -e 's!.*/\([a-z]\+\)!\1!')

if [ -z "$USBDEV" ]; then
    echo "not found usb device"
    exit 1
fi

INFILE=./container/home/yocto/build-rpi/tmp/deploy/images/raspberrypi4/custom-test-image-raspberrypi4.wic.bz2
sudo umount ${OUTDEVICE}?
lsblk
bzcat ${INFILE} | sudo dd of=${OUTDEVICE} status=progress
