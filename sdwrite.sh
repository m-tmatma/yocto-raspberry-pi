#!/bin/sh

OUTDEVICE=/dev/sdb
IMAGE_NAME=core-image-full-cmdline
INFILE=./container/home/yocto/build-rpi/tmp/deploy/images/raspberrypi4/$IMAGE_NAME-raspberrypi4.rpi-sdimg
sudo umount ${OUTDEVICE}?
lsblk
sudo dd if=${INFILE} of=${OUTDEVICE} status=progress


