#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
MIRROR_DIR=$SCRIPT_DIR/mirror

rm -rf $MIRROR_DIR
mkdir  $MIRROR_DIR

cd $MIRROR_DIR
git clone --mirror  https://github.com/yocto-mirror-raspberrypi/poky.git
cd  poky.git
git remote add upstream git://git.yoctoproject.org/poky
git remote update
git push --mirror origin

cd $MIRROR_DIR
git clone --mirror    https://github.com/yocto-mirror-raspberrypi/meta-openembedded.git
cd  meta-openembedded.git
git remote add upstream git://git.yoctoproject.org/meta-openembedded
git remote update
git push --mirror origin

cd $MIRROR_DIR
git clone --mirror    https://github.com/yocto-mirror-raspberrypi/meta-raspberrypi.git
cd  meta-raspberrypi.git
git remote add upstream git://git.yoctoproject.org/meta-raspberrypi
git remote update
git push --mirror origin

cd $SCRIPT_DIR
