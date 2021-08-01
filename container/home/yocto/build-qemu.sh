#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

TARGET_ARCH=qemux86-64
source $SCRIPT_DIR/poky/oe-init-build-env $SCRIPT_DIR/build-qemu
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-oe
bitbake-layers add-layer $SCRIPT_DIR/meta-openembedded/meta-python
bitbake-layers add-layer $SCRIPT_DIR/meta-janssontest
bitbake-layers add-layer $SCRIPT_DIR/meta-custom-image

#cat $SCRIPT_DIR/extra-local.conf >> conf/local.conf

TARGET_SSTATE_DIR=/home/shared/sstate-cache
TARGET_DL_DIR=/home/shared/downloads

rm -f conf/site.conf
if [ -e "$TARGET_SSTATE_DIR" ] ; then
    echo SSTATE_DIR=\"$TARGET_SSTATE_DIR\" >> conf/site.conf
fi
if [ -e "$TARGET_DL_DIR" ] ; then
    echo DL_DIR=\"$TARGET_DL_DIR\" >> conf/site.conf
fi

#bitbake console-image
#bitbake core-image-full-cmdline -c populate_sdk
# bitbake meta-ide-support
# bitbake meta-toolchain

# find $SCRIPT_DIR/build-qemu/tmp/deploy/sdk -name *.sh | xargs -n 1 -I "{}" sh -c "{} -y"

#bitbake core-image-full-cmdline
#bitbake console-image
bitbake jansson-util-lib  jansson-python  jansson-test  jansson-gtest -c cleansstate
bitbake custom-image -c rootfs -f
bitbake custom-image

