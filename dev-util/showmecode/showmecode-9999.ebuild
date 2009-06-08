# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit git

DESCRIPTION="Script for pasting code to showmecode.com."
HOMEPAGE="http://github.com/Zert/devtools/tree/master"
EGIT_REPO_URI="git://github.com/Zert/devtools.git"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="dev-lang/python"
RDEPEND=""

src_install() {
		install -d "${D}/usr/bin/" || die "install failed"
		install src/showmecode "${D}/usr/bin/" || die "install failed"
}
