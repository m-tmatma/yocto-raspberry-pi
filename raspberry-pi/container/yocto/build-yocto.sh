#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd poky
source oe-init-build-env build-rpi
#bitbake-layers remove-layer meta-yocto-bsp
bitbake-layers add-layer ../meta-openembedded/meta-oe
bitbake-layers add-layer ../meta-openembedded/meta-python
bitbake-layers add-layer ../meta-openembedded/meta-multimedia
bitbake-layers add-layer ../meta-openembedded/meta-networking
bitbake-layers add-layer ../meta-qt5
bitbake-layers add-layer ../meta-raspberrypi
bitbake-layers add-layer ../meta-rpi

cat $SCRIPT_DIR/extra-local.conf >> conf/local.conf
mkdir -p $SCRIPT_DIR/downloads
ln -sf   $SCRIPT_DIR/downloads

#bitbake console-image
bitbake core-image-full-cmdline -c populate_sdk

PASSWORD=yocto
find ./tmp/deploy/sdk -name *.sh | xargs -n 1 -I "{}" sh -c "echo ${PASSWORD} | sudo -S {} -y"

bitbake core-image-full-cmdline

