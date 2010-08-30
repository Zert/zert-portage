# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils

DESCRIPTION="Yet Another Metadata Injector for FLV"
SRC_URI="mirror://sourceforge/yamdi/yamdi/${PV}/${P}.tar.gz"
HOMEPAGE="http://yamdi.sourceforge.net/"
LICENSE="BSD"
DEPEND=""
RDEPEND="${DEPEND}"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

src_configure() {
	true
}

src_compile() {
	emake CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64" || die "emake compilation failed"
}

src_install() {
	sed -i -e 's/-m 4755/-m 0755/' Makefile
	mkdir -p "${D}"/usr/bin/
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README CHANGES
	doman man1/yamdi.1
}
