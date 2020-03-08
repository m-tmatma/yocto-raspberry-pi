#!/bin/bash -e

ROOTDIR=container/yocto/poky

pushd  $ROOTDIR                    &&  git pull origin  && popd
pushd  $ROOTDIR/meta-openembedded  &&  git pull origin  && popd
pushd  $ROOTDIR/meta-raspberrypi   &&  git pull origin  && popd
