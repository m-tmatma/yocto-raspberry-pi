#!/bin/bash -ev

SCRIPT_DIR=$(cd $(dirname $0); pwd)
REPO_URL=$SCRIPT_DIR

# Top dir of source
HOST_DOCKER_HOME=$SCRIPT_DIR/container/home/yocto

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
mkdir -p $REPO_DIR
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO}
chmod a+x ${REPO}
PATH=${REPO_DIR}:$PATH

repo init -u $REPO_URL -b $(git rev-parse HEAD)
repo sync -j$(nproc --all)
