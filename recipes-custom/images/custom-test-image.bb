DESCRIPTION = "test"
require recipes-extended/images/core-image-full-cmdline.bb

IMAGE_INSTALL_append = " \
    coreutils \
    kernel-modules \
"
IMAGE_INSTALL_append = " \
    nginx \
"
