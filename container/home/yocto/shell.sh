#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $SCRIPT_DIR/setting.sh
source $SCRIPT_DIR/poky/oe-init-build-env $SCRIPT_DIR/$BUILD_DIR

