# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
# your responsibility to verify that the values are complete and correct.
#
# The following license files were not able to be identified and are
# represented as "Unknown" below, you will need to check them yourself:
#   COPYING
#   LICENSE
#   addons/ooh323c/COPYING
#   codecs/gsm/COPYRIGHT
#   codecs/ilbc/LICENSE
#   codecs/ilbc/LICENSE_ADDENDUM
LICENSE = "Unknown"
LIC_FILES_CHKSUM = "file://COPYING;md5=3c6764ffcbe996d1d8f919b393ccdd67 \
                    file://LICENSE;md5=e8f2ac12f40125052f5a09c009f2f11a \
                    file://addons/ooh323c/COPYING;md5=11c7b65c4a4acb9d5175f7e9bf99c403 \
                    file://codecs/gsm/COPYRIGHT;md5=97e265fa1fd10a668bd99c4945fb9200 \
                    file://codecs/ilbc/LICENSE;md5=ad296492125bc71530d06234d9bfebe0 \
                    file://codecs/ilbc/LICENSE_ADDENDUM;md5=3a2a4c5f0fd98c1bdc8a6f435d76e3f9"

SRC_URI = "http://gerrit.asterisk.org/asterisk/;branch=master"

S = "${WORKDIR}/git"

# NOTE: the following prog dependencies are unknown, ignoring: python2 basename openssl xml dot xmllint patch gmd5sum dirname python2.7 sha1sum sh bash cmp cat nm alembic cut ldconfig bzip2 md5 realpath doxygen curl ln md5sum digest wget fetch git xmlstarlet grep
# NOTE: the following library dependencies are unknown, ignoring: gsm tonezone pq
#       (this is based on recipes that have previously been built and packaged)
DEPENDS = "libxcrypt bison-native flex-native curl"

# NOTE: if this software is not capable of being built in a separate build directory
# from the source, you should replace autotools with autotools-brokensep in the
# inherit line
inherit python3native autotools

# Specify any options you want to pass to the configure script using EXTRA_OECONF:
EXTRA_OECONF = ""

