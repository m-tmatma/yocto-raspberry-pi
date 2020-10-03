#!/bin/bash -e

BRANCHNAME=warrior
ROOTDIR=container/home/yocto

git clone  -b $BRANCHNAME  https://github.com/yocto-mirror-raspberrypi/poky.git                $ROOTDIR/poky
git clone  -b $BRANCHNAME  https://github.com/openembedded/meta-openembedded.git               $ROOTDIR/meta-openembedded
git clone  -b $BRANCHNAME  https://github.com/yocto-mirror-raspberrypi/meta-raspberrypi.git    $ROOTDIR/meta-raspberrypi
git clone  -b $BRANCHNAME  https://github.com/meta-qt5/meta-qt5.git                            $ROOTDIR/meta-qt5
git clone  -b $BRANCHNAME  https://github.com/jumpnow/meta-rpi.git                             $ROOTDIR/meta-rpi
