### Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-lang/io/io-2009.01.02-r1.ebuild,v 1.1 2009/01/02 15:33:32 araujo Exp $

EAPI=2
inherit git eutils qt4

DESCRIPTION="A cross-platform Qt4 WebKit browser"
HOMEPAGE="http://arora.googlecode.com/"
EGIT_REPO_URI="git://github.com/Arora/arora.git"

LICENSE="|| ( GPL-3 GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


RDEPEND="x11-libs/qt-webkit:4"
DEPEND="$RDEPEND"

ARORA_LANGS="da de en es es_CR et fr_CA gl he hu it nl pl pt_BR ru tr"
ARORA_NOLONGLANGS="cs_CZ fr_FR"

for L in $ARORA_LANGS; do
	IUSE="$IUSE linguas_$L"
done
for L in $ARORA_NOLONGLANGS; do
	IUSE="$IUSE linguas_${L%_*}"
done

src_configure() {
	eqmake4 arora.pro PREFIX="${D}/usr"
}

src_compile() {
	emake || die "make failed"

	# don't pre-strip
	sed -i "/strip/d" src/Makefile || die 'sed failed'
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die 'make install failed'
	dodoc AUTHORS ChangeLog README
}
