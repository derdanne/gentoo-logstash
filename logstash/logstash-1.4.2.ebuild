# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="a tool for managing logfiles and events"
HOMEPAGE="http://logstash.net"
SRC_URI="https://download.elasticsearch.org/${PN}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/jre:1.7"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A} 
}

src_install() {
	keepdir /etc/logstash
	insinto /opt/${PN}
	doins -r ./*

	newinitd "${FILESDIR}/init" logstash
	newconfd "${FILESDIR}/conf" logstash

	fperms 0775 /opt/${PN}/bin/{logstash,logstash-test,plugin,logstash-web,logstash.lib.sh}
}

pkg_postinst() {
	elog "Ship logs from any source, parse them, get the right timestamp, index them, and search them!"
	elog "Please visit http://logstash.net/ for configuration guides and documentation."
}
