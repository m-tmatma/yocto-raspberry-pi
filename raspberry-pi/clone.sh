#!/bin/bash -e

BRANCHNAME=zeus
ROOTDIR=container/yocto/poky

git clone  -b $BRANCHNAME  https://github.com/yocto-mirror-raspberrypi/pocky.git               $ROOTDIR
git clone  -b $BRANCHNAME  https://github.com/yocto-mirror-raspberrypi/meta-openembedded.git   $ROOTDIR/meta-openembedded
git clone  -b $BRANCHNAME  https://github.com/yocto-mirror-raspberrypi/meta-raspberrypi.git    $ROOTDIR/meta-raspberrypi
git clone  -b $BRANCHNAME  https://github.com/meta-qt5/meta-qt5.git                            $ROOTDIR/meta-qt5
git clone  -b $BRANCHNAME  https://github.com/jumpnow/meta-rpi.git                             $ROOTDIR/meta-rpi

