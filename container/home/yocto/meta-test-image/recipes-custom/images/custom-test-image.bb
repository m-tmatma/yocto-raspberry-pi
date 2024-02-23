DESCRIPTION = "test"
require recipes-extended/images/core-image-full-cmdline.bb

IMAGE_INSTALL:append = " \
    coreutils \
    kernel-modules \
"
IMAGE_INSTALL:append = " \
    nginx \
    ntpdate \
    avahi-daemon \
"
IMAGE_INSTALL_append = " \
    go-helloworld \
"
