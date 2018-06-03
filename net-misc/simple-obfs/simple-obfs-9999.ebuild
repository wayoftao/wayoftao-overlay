# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils autotools git-r3

EGIT_REPO_URI="https://github.com/shadowsocks/simple-obfs.git"

DESCRIPTION="A simple obfuscating tool"
HOMEPAGE="https://github.com/shadowsocks/simple-obfs"
[[ ${PV} = 9999 ]] || SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
[[ ${PV} = 9999 ]] || KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

DEPEND="doc? ( app-text/asciidoc )
		app-text/xmlto
		sys-libs/zlib
		dev-libs/openssl
		sys-kernel/linux-headers
		dev-libs/libevent
		dev-libs/libpcre"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable doc documentation)
}

