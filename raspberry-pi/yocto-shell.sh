#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_HOME=$SCRIPT_DIR/container/yocto
TARGET_HOME=/home/yocto

DOCKER_OPT=$SCRIPT_DIR/container/opt
TARGET_OPT=/opt

mkdir -p $DOCKER_HOME
mkdir -p $DOCKER_OPT
docker run -it -u yocto:yocto -v $DOCKER_OPT:$TARGET_OPT -v $DOCKER_HOME:$TARGET_HOME -w $TARGET_HOME yocto-raspberry /bin/bash


