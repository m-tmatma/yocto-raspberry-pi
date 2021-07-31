FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update --fix-missing && apt-get dist-upgrade -y && apt-get autoremove --purge -y \
 && apt-get install --fix-missing -y \
     gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
     xterm \
     locales \
     sudo \
     nano \
     vim  \
     tmux \
     gosu \
     bash-completion \
     kmod \
     iproute2 \
     iptables \
 && rm -rf /var/lib/apt/lists/*

# Locales
RUN dpkg-reconfigure locales \
 && locale-gen en_US.UTF-8 \
 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN mkdir -p /dev/net && mknod /dev/net/tun c 10 200 && chmod 666 /dev/net/tun

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

