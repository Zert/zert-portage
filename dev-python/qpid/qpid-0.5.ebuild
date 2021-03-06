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
	cd ${S}/python/
	for i in qpid mllib qmf; do
		sitedir=$(python_get_sitedir)/${i}
		mkdir -p ${D}/${sitedir} || die "cannot create ${sitedir}"
		cp ${i}/*.py ${D}/${sitedir}
	done
}

src_compile() {
	true
}

pkg_postinst() {
    python_mod_optimize $(python_get_sitedir)/{qpid,mllib,qmf}
}

pkg_postrm() {
    python_mod_cleanup /usr/$(get_libdir)/python*/site-packages/{qpid,mllib,qmf}
}
