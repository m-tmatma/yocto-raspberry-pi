#!/bin/sh

docker run -it -u yocto:yocto -v $(pwd):$(pwd) -w $(pwd) yocto-raspberry /bin/bash

