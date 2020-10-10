#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
rm -f $SCRIPT_DIR/nohup.out
nohup $SCRIPT_DIR/yocto-build.sh $1 &
