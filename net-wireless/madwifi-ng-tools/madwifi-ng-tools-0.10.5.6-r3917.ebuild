# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-wireless/madwifi-ng-tools/madwifi-ng-tools-0.9.4.ebuild,v 1.3 2008/07/07 22:34:57 gentoofan23 Exp $

inherit toolchain-funcs

MADWIFI_HAL_SNAPSHOT=r3917-20090116
MY_PVR=${PN/-ng-tools/-hal}-${PV}-${MADWIFI_HAL_SNAPSHOT}
MY_PV=${P/-ng-tools/-hal}

S=${WORKDIR}/${MY_PVR}/tools

DESCRIPTION="Next Generation tools for configuration of Atheros based IEEE 802.11a/b/g wireless LAN cards"
HOMEPAGE="http://www.madwifi.org/"
SRC_URI="http://snapshots.madwifi.org/${MY_PV}/${MY_PVR}.tar.gz"

LICENSE="|| ( BSD GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"

IUSE=""
DEPEND="virtual/libc"
RDEPEND="!net-wireless/madwifi-old-tools
		${DEPEND}"

src_unpack() {
	unpack ${A}

	# format string fix from solar
	#sed -i \
#		-e 's:err(1, ifr.ifr_name);:err(1, "%s", ifr.ifr_name);:g' \
#		${S}/tools/athstats.c || die

einfo "S=$S"
einfo "PV=$PV"

	sed -i \
		-e "s:CC =.*:CC = $(tc-getCC):" \
		-e "s:CFLAGS=:CFLAGS+=:" \
		-e "s:LDFLAGS=:LDFLAGS+=:" \
		"${S}"/Makefile || die
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" BINDIR=/usr/bin MANDIR=/usr/share/man STRIP=echo \
		install || die "emake install failed"

	dodir /sbin
	mv "${D}"/usr/bin/wlanconfig "${D}"/sbin

	# install headers for use by
	# net-wireless/wpa_supplicant and net-wireless/hostapd
	cd "${S}"/..
	insinto /usr/include/madwifi/include/
	doins include/*.h
	insinto /usr/include/madwifi/net80211
	doins net80211/*.h
}

pkg_postinst() {
	if [ -e "${ROOT}"/etc/udev/rules.d/65-madwifi.rules ]; then
		ewarn
		ewarn "The udev rules for creating interfaces (athX) are no longer needed."
		ewarn
		ewarn "You should manually remove the /etc/udev/rules.d/65-madwifi.rules file"
		ewarn "and either run 'udevstart' or reboot for the changes to take effect."
		ewarn
	fi
	einfo
	einfo "If you use net-wireless/wpa_supplicant or net-wireless/hostapd with
madwifi"
	einfo "you should remerge them now."
	einfo
}
