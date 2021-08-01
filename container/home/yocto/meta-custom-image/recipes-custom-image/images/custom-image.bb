include recipes-extended/images/core-image-full-cmdline.bb

# Include modules in rootfs
IMAGE_INSTALL += " \
	kernel-modules \
	"
