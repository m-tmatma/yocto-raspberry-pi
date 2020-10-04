#!/bin/sh

OUTDEVICE=/dev/sdb
INFILE=./container/home/yocto/build-rpi/tmp/deploy/images/raspberrypi4/console-image-raspberrypi4.rpi-sdimg
sudo umount ${OUTDEVICE}?
lsblk
sudo dd if=${INFILE} of=${OUTDEVICE} status=progress


