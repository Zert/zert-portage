# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $$

inherit distutils

DESCRIPTION="Python library for communicating with AMQP peers and brokers using Twisted"
HOMEPAGE="https://launchpad.net/txamqp"
SRC_URI="http://launchpad.net/txamqp/trunk/${PV}/+download/${P}.tar.bz2"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

DEPEND="dev-lang/python
		dev-python/twisted"
