#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/poky/oe-init-build-env $SCRIPT_DIR/build-rpi
bitbake-layers add-layer $SCRIPT_DIR/meta-raspberrypi

cat $SCRIPT_DIR/extra-local.conf >> conf/local.conf

TARGET_SSTATE_DIR=/home/shared/sstate-cache
TARGET_DL_DIR=/home/shared/downloads

rm -f conf/site.conf
if [ -e "$TARGET_SSTATE_DIR" ] ; then
    echo SSTATE_DIR=\"$TARGET_SSTATE_DIR\" >> conf/site.conf
fi
if [ -e "$TARGET_DL_DIR" ] ; then
    echo DL_DIR=\"$TARGET_DL_DIR\" >> conf/site.conf
fi

# bitbake console-image
# bitbake core-image-full-cmdline -c populate_sdk
# bitbake meta-ide-support
# bitbake meta-toolchain

# find $SCRIPT_DIR/build-rpi/tmp/deploy/sdk -name *.sh | xargs -n 1 -I "{}" sh -c "{} -y"

bitbake custom-test-image
#bitbake console-image
