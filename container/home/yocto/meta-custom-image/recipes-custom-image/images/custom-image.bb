include recipes-extended/images/core-image-full-cmdline.bb

# Include modules in rootfs
IMAGE_INSTALL += " \
	kernel-modules \
	"

IMAGE_INSTALL += " \
	python3 \
	jansson-test \
	jansson-python \
	jansson-gtest \
	"

RDEPENDS_${PN} += "python3"
RDEPENDS_${PN} += "jansson-test"
RDEPENDS_${PN} += "jansson-util-lib"
RDEPENDS_${PN} += "jansson-gtest"
