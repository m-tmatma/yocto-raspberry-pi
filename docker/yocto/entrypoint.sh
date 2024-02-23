#!/bin/bash

USER_ID=${LOCAL_UID:-1000}
GROUP_ID=${LOCAL_GID:-1000}
USERNAME=yocto
HOME_DIR=/home/yocto

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd  -u $USER_ID -o -M $USERNAME
groupmod -g $GROUP_ID $USERNAME
export USER=$USERNAME
export HOME=$HOME_DIR

# add script to suders
echo yocto ALL=NOPASSWD: /home/yocto/poky/scripts/runqemu-ifup >> "/etc/sudoers"
echo yocto ALL=NOPASSWD: /home/yocto/poky/scripts/runqemu-ifdown >> "/etc/sudoers"

exec /usr/sbin/gosu $USERNAME "$@"

