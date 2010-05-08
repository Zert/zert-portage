# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit eutils

DESCRIPTION="Generate Ragel state machine description out from ABNF"
SRC_URI="http://www.2p.cz/files/2p.cz/downloads/${PN}-src.${PV}.tgz"
HOMEPAGE="http://www.2p.cz/en/abnf_gen"


SLOT="0"
LICENSE="GPL"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

DEPEND="dev-util/ragel"

src_install() {
		dobin abnfgen
		make docs
		mv abnfgen.1.man abnfgen.1
		doman abnfgen.1
		dodoc abnfgen.1.html abnfgen-HOWTO.txt
}


