#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# 'repo' command
REPO_DIR=$SCRIPT_DIR/bin
REPO=$REPO_DIR/repo

# get 'repo'
mkdir -p $REPO_DIR
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ${REPO}
chmod a+x ${REPO}
PATH=${REPO_DIR}:$PATH

repo init -m default.xml -u $(git rev-parse --show-toplevel) -b $(git rev-parse HEAD)
repo sync -j4
