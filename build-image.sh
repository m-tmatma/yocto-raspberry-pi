#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${SCRIPT_DIR}/common-variable.sh

docker build \
    --build-arg http_proxy=$http_proxy \
    --build-arg https_proxy=$https_proxy \
    -t $DOCKERIMAGE $DOCKERFILE_DIR

