#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

REPO_PATH=$(which repo)
if [ -z "$REPO_PATH" ]; then
    echo "Please install google repo by 'sudo apt install -y repo' on ubuntu 20.10 or later."
    exit 1
fi

repo init -m default.xml -u $(git rev-parse --show-toplevel) -b $(git rev-parse HEAD)
repo sync -j4
