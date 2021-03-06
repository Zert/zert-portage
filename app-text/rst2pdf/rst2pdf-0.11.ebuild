# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit distutils

DESCRIPTION="Tool for transforming reStructuredText to PDF using ReportLab"
SRC_URI="http://rst2pdf.googlecode.com/files/${P}.tar.gz"
HOMEPAGE="http://rst2pdf.googlecode.com/"

SLOT="0"
LICENSE="MIT"
KEYWORDS="amd64 ia64 ppc ppc64 sparc x86"
IUSE="math"

DEPEND="dev-lang/python
		dev-python/docutils
		dev-python/simplejson
		dev-python/pygments
		>=dev-python/reportlab-2.1
		dev-python/imaging
		math? ( dev-python/matplotlib )"

src_install() {
		distutils_src_install
		dodoc README.txt Contributors.txt CHANGES.txt doc/DEVELOPERS.txt
		doman doc/rst2pdf.1
		docinto doc
		dodoc doc/config.sample doc/manual.pdf doc/manual.txt \
			  doc/rst2pdf.txt doc/sampler.style doc/sampler.txt
		insinto /usr/share/doc/${PF}/examples
		doins doc/montecristo/*
}
