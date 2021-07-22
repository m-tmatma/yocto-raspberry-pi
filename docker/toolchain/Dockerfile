FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --fix-missing \
 && apt-get install -y python3 \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get autoremove --purge -y

COPY poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-3.1.9.sh /tmp
RUN  /tmp/poky-glibc-x86_64-core-image-minimal-core2-64-qemux86-64-toolchain-3.1.9.sh -y
