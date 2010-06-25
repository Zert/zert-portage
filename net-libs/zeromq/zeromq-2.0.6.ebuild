# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

EAPI=3

inherit autotools eutils multilib

DESCRIPTION="ZeroMQ"
HOMEPAGE="http://www.zeromq.org"
SRC_URI="http://www.zeromq.org/local--files/area:download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/${P}.poll.patch
}

src_install() {
	emake install DESTDIR="${D}" || die "Install failed"
	dodoc README NEWS ChangeLog || die "dodoc failed"
	doman doc/*.[0-9]
}
