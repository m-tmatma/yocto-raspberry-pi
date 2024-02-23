#!/bin/sh -x

SCRIPT_DIR=$(cd $(dirname $0); pwd)
MIRROR_DIR=$SCRIPT_DIR/mirror

rm -rf $MIRROR_DIR
mkdir  $MIRROR_DIR

mirror_yocoto() {
    TARGET_DIR=$SCRIPT_DIR/$1
    git clone --mirror git://git.yoctoproject.org/$1 $TARGET_DIR
    git -C $TARGET_DIR push --mirror https://github.com/yocto-mirror-raspberrypi/$1.git
    rm -rf $TARGET_DIR
}

mirror_yocoto poky
mirror_yocoto meta-raspberrypi
