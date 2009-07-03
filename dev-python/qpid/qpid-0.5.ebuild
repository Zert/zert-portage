# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit distutils

DESCRIPTION="QPid Python client"
HOMEPAGE="http://qpid.apache.org/"
SRC_URI="http://www.apache.org/dist/qpid/${PV}/${PN}-python-${PV}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

DEPEND="dev-lang/python"

src_install() {
	sitedir=$(python_get_sitedir)/qpid
	cd ${S}/python/
	cp qpid/*.py ${sitedir}
}

src_compile() {

}

pkg_postinst() {
    python_mod_optimize $(python_get_sitedir)/qpid
}

pkg_postrm() {
    python_mod_cleanup /usr/$(get_libdir)/python*/site-packages/qpid
}

