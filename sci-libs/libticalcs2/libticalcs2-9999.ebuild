# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-r3

DESCRIPTION="Library for communication with TI calculators"
HOMEPAGE="http://lpg.ticalc.org/prj_tilp/"
EGIT_REPO_URI="https://github.com/debrouxl/tilibs.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc nls static-libs"

RDEPEND="
	dev-libs/glib:2
	>=sci-libs/libticables2-1.3.3
	>=sci-libs/libticonv-1.1.3
	>=sci-libs/libtifiles2-1.1.5
	nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS LOGO NEWS README ChangeLog docs/api.txt )

S="${WORKDIR}/${P}/libticalcs/trunk"

src_prepare() {
	eautoreconf
}

src_configure() {
	local myeconfargs=(
		--disable-rpath
		$(use_enable nls)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install
	use doc && dohtml docs/html/*
}
