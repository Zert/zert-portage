# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/sshfs-fuse/sshfs-fuse-2.1.ebuild,v 1.1 2008/09/24 07:06:06 genstef Exp $

inherit eutils

DESCRIPTION="An automounter implemented with FUSE."
SRC_URI="mirror://sourceforge/afuse/${P}.tar.gz"
HOMEPAGE="http://afuse.sourceforge.net/"
LICENSE="GPL-2"
DEPEND=">=sys-fs/fuse-2.6.0_pre3"
RDEPEND="${DEPEND}"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
SLOT="0"
IUSE=""

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README ChangeLog AUTHORS
}
