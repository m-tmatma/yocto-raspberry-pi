

```
mkdir -p rpi-thud/layers
cd rpi-thud/layers
git clone git://git.yoctoproject.org/poky.git -b thud


git clone git://git.yoctoproject.org/meta-raspberrypi -b thud
git clone git://git.openembedded.org/meta-openembedded -b thud
cd ../
```

```
source layers/poky/oe-init-build-env build
```

```
bitbake-layers add-layer ../layers/meta-openembedded/meta-oe
bitbake-layers add-layer ../layers/meta-openembedded/meta-python
bitbake-layers add-layer ../layers/meta-openembedded/meta-networking
bitbake-layers add-layer ../layers/meta-raspberrypi/
```

conf/local.conf

```
MACHINE = "raspberrypi3"
DL_DIR ?= "${TOPDIR}/../downloads"

# enable uart
ENABLE_UART = "1"

# systemd
DISTRO_FEATURES_append = " systemd pam"
VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
VIRTUAL-RUNTIME_initscripts = ""
```

```
ln -s ~/downloads
```

```
bitbake console-basic-image 
```

