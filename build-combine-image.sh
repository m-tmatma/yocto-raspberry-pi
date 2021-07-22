#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${SCRIPT_DIR}/common-variable.sh

echo docker build -t $COMBINE_DOCKERIMAGE $COMBINE_DOCKERFILE_DIR
docker build -t $COMBINE_DOCKERIMAGE $COMBINE_DOCKERFILE_DIR
