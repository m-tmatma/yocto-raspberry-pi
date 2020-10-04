#!/bin/bash -e

ROOTDIR=container/home/yocto

update () {
	echo update $1
	pushd $ROOTDIR/$1 && git pull origin && popd
}

update meta-openembedded
update meta-qt5
update meta-raspberrypi
update meta-rpi
update poky

