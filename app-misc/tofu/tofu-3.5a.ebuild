# Copyright 1999-2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Plain (stupid) text-based todo manager"
HOMEPAGE="https://requiescant.tuxfamily.org https://web.archive.org/web/20150912025928/http://requiescant.tuxfamily.org/pages/PAGE20080212T.html"
SRC_URI="https://requiescant.tuxfamily.org/${P}.tar.bz2"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/perl"

src_configure() { :; }

src_install() {
	dodoc CHANGELOG README
	doman share/*
	dobin ${PN} tofuup
}

pkg_postinst() {
	elog "If you are using ${PN}<3.0 you should run tofuup first."
}
