# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/io/io-2009.01.02-r1.ebuild,v 1.1 2009/01/02 15:33:32 araujo Exp $

inherit git

DESCRIPTION="Io is a small, prototype-based programming language."
HOMEPAGE="http://www.iolanguage.com"
EGIT_REPO_URI="git://github.com/stevedekorte/io.git"


LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc readline mysql cairo postgres dbi opengl ncurses sqlite sqlite3 zlib lzo"
DEPEND="lzo? ( dev-libs/lzo )
		readline? ( sys-libs/readline )
		mysql? ( virtual/mysql )
		cairo? ( x11-libs/cairo )
		postgres? ( virtual/postgresql-server )
		opengl? ( virtual/opengl )
		dbi? ( dev-db/libdbi )
		ncurses? ( sys-libs/ncurses )
		sqlite? ( dev-db/sqlite )
		sqlite3? ( >=dev-db/sqlite-3.0.0 )
		zlib? ( sys-libs/zlib )"
RDEPEND=""

src_compile() {
	make INSTALL_PREFIX="/usr" vm || die "make failed."
	make addons
}

src_install() {
	make install \
		INSTALL_PREFIX="${D}/usr" \
		|| die "make install failed"
	if use doc; then
		dodoc docs/docs.css docs/*.html
	fi
}
