#!/bin/sh

sudo umount /dev/sda?
lsblk
sudo dd if=./poky/build-rpi/tmp/deploy/images/raspberrypi3/console-image-raspberrypi3.rpi-sdimg of=/dev/sda

