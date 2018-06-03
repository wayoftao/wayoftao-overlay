# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools systemd git-r3

DESCRIPTION="A lightweight secured SOCKS5 proxy for embedded devices and low end boxes"
HOMEPAGE="https://github.com/shadowsocks/shadowsocks-libev"

MY_PV="v${PV}"
EGIT_REPO_URI="https://github.com/shadowsocks/shadowsocks-libev.git"
EGIT_SUBMODULES=('*')

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="debug doc -system-libs"

RDEPEND=">=dev-libs/libsodium-1.0.8
		dev-libs/libev
		net-libs/udns
		net-libs/mbedtls
		dev-libs/libpcre
		net-dns/c-ares
	"
DEPEND="${RDEPEND}
	sys-kernel/linux-headers
	virtual/pkgconfig
	sys-devel/gettext
	doc? (
		app-text/asciidoc
		app-text/xmlto
	)
	"

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf \
		$(use_enable debug assert) \
		$(use_enable doc documentation) \
		$(use_enable system-libs system-shared-lib)
}

src_install() {
	default
	prune_libtool_files --all

	dodir "/etc/${PN}"
	insinto "/etc/${PN}"
	newins "${FILESDIR}/shadowsocks.json" shadowsocks.json

	newinitd "${FILESDIR}/shadowsocks.initd" shadowsocks
	dosym /etc/init.d/shadowsocks /etc/init.d/shadowsocks.server
	dosym /etc/init.d/shadowsocks /etc/init.d/shadowsocks.client
	dosym /etc/init.d/shadowsocks /etc/init.d/shadowsocks.redir
	dosym /etc/init.d/shadowsocks /etc/init.d/shadowsocks.tunnel

	systemd_newunit "${FILESDIR}/${PN}-local_at.service" "${PN}-local@.service"
	systemd_newunit "${FILESDIR}/${PN}-server_at.service" "${PN}-server@.service"
	systemd_newunit "${FILESDIR}/${PN}-redir_at.service" "${PN}-redir@.service"
	systemd_newunit "${FILESDIR}/${PN}-tunnel_at.service" "${PN}-tunnel@.service"
}

pkg_setup() {
	elog "You need to choose the mode"
	elog "  server: rc-update add shadowsocks.server default"
	elog "  client: rc-update add shadowsocks.client default"
	elog "  redir:  rc-update add shadowsocks.redir default"
	elog "  tunnel: rc-update add shadowsocks.tunnel default"
}
