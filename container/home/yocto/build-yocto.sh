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

cat $SCRIPT_DIR/extra-local.conf >> conf/local.conf
mkdir -p $SCRIPT_DIR/downloads
ln -sf   $SCRIPT_DIR/downloads

#bitbake console-image
#bitbake core-image-full-cmdline -c populate_sdk
bitbake meta-ide-support
bitbake meta-toolchain

find $SCRIPT_DIR/build-rpi/tmp/deploy/sdk -name *.sh | xargs -n 1 -I "{}" sh -c "{} -y"

#bitbake core-image-full-cmdline
bitbake console-image

