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
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=3c6764ffcbe996d1d8f919b393ccdd67 \
                    file://LICENSE;md5=e8f2ac12f40125052f5a09c009f2f11a \
                    file://addons/ooh323c/COPYING;md5=11c7b65c4a4acb9d5175f7e9bf99c403 \
                    file://codecs/gsm/COPYRIGHT;md5=97e265fa1fd10a668bd99c4945fb9200 \
                    file://codecs/ilbc/LICENSE;md5=ad296492125bc71530d06234d9bfebe0 \
                    file://codecs/ilbc/LICENSE_ADDENDUM;md5=3a2a4c5f0fd98c1bdc8a6f435d76e3f9"

SRC_URI = "git://gerrit.asterisk.org/asterisk;protocol=https;branch=20.2"
PV = "20.2.1+git${SRCPV}"
SRCREV = "1d64cb99d2899c6f73acd3ae4f475b8fc3fb58f1"

S = "${WORKDIR}/git"

# NOTE: the following prog dependencies are unknown, ignoring: python2 basename openssl xml dot xmllint patch gmd5sum dirname python2.7 sha1sum sh bash cmp cat nm alembic cut ldconfig bzip2 md5 realpath doxygen curl ln md5sum digest wget fetch git xmlstarlet grep
# NOTE: the following library dependencies are unknown, ignoring: gsm tonezone pq
#       (this is based on recipes that have previously been built and packaged)
DEPENDS = "speex readline zlib openssl curl popt gnutls sqlite libogg libvorbis"
DEPENDS += "libxcrypt bison-native flex-native libtool-native curl"
DEPENDS += "libedit"

# NOTE: if this software is not capable of being built in a separate build directory
# from the source, you should replace autotools with autotools-brokensep in the
# inherit line
inherit python3native autotools pkgconfig

# INITSCRIPT_NAME = "asterisk"
# INITSCRIPT_PARAMS = "defaults 60"

# inherit autotools update-rc.d

# Specify any options you want to pass to the configure script using EXTRA_OECONF:
# EXTRA_OECONF =  "--with-ssl=${STAGING_EXECPREFIXDIR}\
# 			--with-z=${STAGING_EXECPREFIXDIR}\
# 			--with-curl=${STAGING_EXECPREFIXDIR}\
# 			--with-termcap=${STAGING_EXECPREFIXDIR}\
# 			--with-ogg=${STAGING_EXECPREFIXDIR}\
# 			--with-vorbis=${STAGING_EXECPREFIXDIR}\
# 			--with-sqlite=${STAGING_EXECPREFIXDIR}\
# 			--with-popt=${STAGING_EXECPREFIXDIR}\
# 			--with-gnutls=${STAGING_EXECPREFIXDIR}\
# 			--without-curses\
# 			--with-ncurses=${STAGING_EXECPREFIXDIR}\
# 			--without-imap\
# 			--without-netsnmp\
# 			--without-odbc\
# 			--without-osptk\
# 			--without-nbs\
# 			--without-pwlib\
# 			--without-radius\
# 			--without-tds\
# 			--without-postgres\
# 			--without-zaptel\
# 			"

# export ASTCFLAGS = "-fsigned-char -I${STAGING_INCDIR} -DPATH_MAX=4096"
# export ASTLDFLAGS="${LDFLAGS} -lpthread -ldl -lresolv "
# export PROC="${ARCH}"

# do_configure:prepend () {
# 	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/logrotate
# 	sed -i 's:/etc/init.d:${sysconfdir}/init.d:' ${WORKDIR}/logrotate
# 	sed -i 's:/var:${localstatedir}:' ${WORKDIR}/volatiles
# }

# do_configure () {
# 	# Looks like rebuilding configure doesn't work, so we are skipping
# 	# that and are just using the shipped one
# 	gnu-configize
# 	libtoolize --force
# 	oe_runconf
# }


# do_compile() {
#         (
#          #make sure that menuselect gets build using host toolchain
#          unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS RANLIB
#          cd menuselect
#          ./configure
#          oe_runmake
#          cd ../
#         ) || exit 1
#         oe_runmake
# }

# do_stage() {
# 	autotools_stage_includes
# }

# do_install:append() {
# 	install -d ${D}${sysconfdir}/init.d/
# 	install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/asterisk
# 	install -c -D -m 644 ${WORKDIR}/logrotate ${D}${sysconfdir}/logrotate.d/asterisk
# 	install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/asterisk
# }

# pkg_postinst:prepend() {
# 	grep -q asterisk  ${sysconfdir}/group || addgroup --system asterisk
# 	grep -q asterisk ${sysconfdir}/passwd || adduser --system --home ${localstatedir}/run/asterisk --no-create-home --disabled-password --ingroup asterisk -s ${base_bindir}/false asterisk
# 	chown -R asterisk:asterisk ${libdir}/asterisk ${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk ${localstatedir}/log/asterisk ${localstatedir}/run/asterisk ${sysconfdir}/asterisk
# }

# FILES:${PN} += "${libdir}/asterisk/modules/*"
# FILES:${PN}-dbg += "${libdir}/asterisk/modules/.debug \
#                     ${localstatedir}/lib/asterisk/*/.debug"

# CONFFILES:${PN} += "${sysconfdir}/asterisk/adsi.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/adtranvofr.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/agents.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/alarmreceiver.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/alsa.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/amd.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/asterisk.adsi"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/asterisk.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_adaptive_odbc.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_custom.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_manager.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_odbc.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_pgsql.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_sqlite3_custom.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cdr_tds.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/cli.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/codecs.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/console.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/dnsmgr.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/dundi.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/enum.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/extconfig.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/extensions.ael"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/extensions.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/extensions.lua"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/extensions_minivm.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/features.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/festival.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/followme.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/func_odbc.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/gtalk.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/h323.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/http.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/iax.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/iaxprov.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/indications.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/jabber.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/jingle.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/logger.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/manager.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/meetme.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/mgcp.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/minivm.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/misdn.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/modules.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/musiconhold.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/muted.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/osp.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/oss.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/phone.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/phoneprov.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/queuerules.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/queues.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/res_ldap.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/res_odbc.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/res_pgsql.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/res_snmp.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/rpt.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/rtp.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/say.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/sip.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/sip_notify.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/skinny.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/sla.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/smdi.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/telcordia-1.adsi"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/udptl.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/unistim.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/usbradio.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/users.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/voicemail.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/vpb.conf"
# CONFFILES:${PN} += "${sysconfdir}/asterisk/zapata.conf"
# CONFFILES:${PN} += "${sysconfdir}/logrotate.d/asterisk"
