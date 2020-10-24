#!/bin/bash -e

BRANCHNAME=$(git symbolic-ref --short HEAD)
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
mkdir -p $REPO_DIR
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO}
chmod a+x ${REPO}
PATH=${REPO_DIR}:$PATH

repo init -u https://github.com/m-tmatma/yocto-raspberry-pi.git -b $BRANCHNAME
repo sync -j4
