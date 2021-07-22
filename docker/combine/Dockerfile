FROM yocto-raspberry-pi.git-toolchain:ubuntu20.04-3  AS toolchain

FROM yocto-raspberry-pi.git:ubuntu20.04-3  AS yoctobase
COPY --from=toolchain /opt /opt
