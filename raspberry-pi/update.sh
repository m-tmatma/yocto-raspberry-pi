#!/bin/bash -e

ROOTDIR=container/yocto/poky

pushd  $ROOTDIR                    &&  git remote update  && popd
pushd  $ROOTDIR/meta-openembedded  &&  git remote update  && popd
