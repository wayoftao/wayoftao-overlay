# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-r3

DESCRIPTION="Charset conversion library for TI calculators"
HOMEPAGE="http://lpg.ticalc.org/prj_tilp/"
EGIT_REPO_URI="https://github.com/debrouxl/tilibs"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc static-libs"

RDEPEND="dev-libs/glib:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS LOGO NEWS README ChangeLog docs/api.txt )

S="${WORKDIR}/${P}/libticonv/trunk"

src_prepare() {
	eautoreconf
}

src_install() {
	autotools-utils_src_install
	if use doc; then
		dohtml docs/html/*
		docinto charsets
		dohtml docs/charsets/*
	fi
}
