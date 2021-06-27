#!/bin/sh -x

SCRIPT_DIR=$(cd $(dirname $0); pwd)
MIRROR_DIR=$SCRIPT_DIR/mirror

rm -rf $MIRROR_DIR
mkdir  $MIRROR_DIR

mirror_yocoto() {
    git clone --bare git://git.yoctoproject.org/$1 $1
    cd $1
    git push --mirror https://github.com/yocto-mirror-raspberrypi/$1.git
    cd ..

    rm -rf $1
}

cd $MIRROR_DIR

mirror_yocoto poky
mirror_yocoto meta-raspberrypi

cd $SCRIPT_DIR
