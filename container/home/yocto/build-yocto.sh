#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

source $SCRIPT_DIR/poky/oe-init-build-env $SCRIPT_DIR/build-rpi
#bitbake-layers remove-layer $SCRIPT_DIR/meta-yocto-bsp
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-oe
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-python
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-multimedia
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-networking
bitbake-layers add-layer $SCRIPT_DIR/meta-qt5
bitbake-layers add-layer $SCRIPT_DIR/meta-raspberrypi
bitbake-layers add-layer $SCRIPT_DIR/meta-rpi
bitbake-layers add-layer $SCRIPT_DIR/meta-codechecker
bitbake-layers add-layer $SCRIPT_DIR/meta-test

cat $SCRIPT_DIR/extra-local.conf >> conf/local.conf
#cat $SCRIPT_DIR/extra-bitbake.conf >> conf/bitbake.conf

#TARGET_SSTATE_DIR=/home/shared/sstate-cache
TARGET_DL_DIR=/home/shared/downloads

rm -f conf/bitbake.conf
rm -f conf/site.conf
if [ -e "$TARGET_SSTATE_DIR" ] ; then
    echo SSTATE_DIR=\"$TARGET_SSTATE_DIR\" >> conf/site.conf
fi
if [ -e "$TARGET_DL_DIR" ] ; then
    echo DL_DIR=\"$TARGET_DL_DIR\" >> conf/site.conf
fi

#bitbake console-image
#bitbake core-image-full-cmdline -c populate_sdk
#bitbake meta-ide-support
#bitbake meta-toolchain
#export BB_ENV_EXTRAWHITE="LD_PRELOAD LD_LIBRARY_PATH CC_LOGGER_FILE CC_LOGGER_GCC_LIKE $BB_ENV_EXTRAWHITE"
bitbake test-image -c populate_sdk
bitbake test-image -c rootfs
bitbake test-image

find $SCRIPT_DIR/build-rpi/tmp/deploy/sdk -name *.sh | xargs -n 1 -I "{}" sh -c "{} -y"

#bitbake core-image-full-cmdline
#bitbake console-image

