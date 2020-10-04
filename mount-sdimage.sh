#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
IMG_FILE=$SCRIPT_DIR/container/home/yocto/build-rpi/tmp/deploy/images/raspberrypi4/console-image-raspberrypi4.rpi-sdimg

LOOPBACK_DEVICE=`losetup --show -f -P $IMG_FILE`
MOUNT_POINT=/mnt/rpi-img

mkdir -p   $MOUNT_POINT
mount      ${LOOPBACK_DEVICE}p2 $MOUNT_POINT

ls -l $MOUNT_POINT

umount                          $MOUNT_POINT
losetup -d ${LOOPBACK_DEVICE}
losetup -a

