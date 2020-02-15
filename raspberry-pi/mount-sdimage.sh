#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
LOOPBACK_DEVICE=`losetup --show -f -P $SCRIPT_DIR/container/yocto/poky/build-rpi/tmp/deploy/images/raspberrypi4/console-image-raspberrypi4.rpi-sdimg`
MOUNT_POINT=/mnt/rpi-img

mount      ${LOOPBACK_DEVICE}p2 $MOUNT_POINT

ls -l $MOUNT_POINT

umount                          $MOUNT_POINT
losetup -d ${LOOPBACK_DEVICE}
losetup -a

