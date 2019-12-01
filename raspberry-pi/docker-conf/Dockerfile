FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
 && apt-get install --fix-missing -y \
     gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm \ 
     locales \
 && rm -rf /var/lib/apt/lists/*

# Locales
RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ENV USER yocto
ENV HOME /home/${USER}
ENV SHELL /bin/bash
RUN useradd -m ${USER}
RUN gpasswd -a ${USER} sudo
RUN echo "${USER}:yocto" | chpasswd

