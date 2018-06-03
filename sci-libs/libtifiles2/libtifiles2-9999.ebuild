# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit autotools-utils git-r3

DESCRIPTION="Library for TI calculator files"
HOMEPAGE="http://lpg.ticalc.org/prj_tilp/"
EGIT_REPO_URI="https://github.com/debrouxl/tilibs.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc nls static-libs"

RDEPEND="
	app-arch/libarchive
	dev-libs/glib:2
	>=sci-libs/libticables2-1.3.3
	>=sci-libs/libticonv-1.1.3
	nls? ( virtual/libintl )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS LOGO NEWS README ChangeLog docs/api.txt )

S="${WORKDIR}/${P}/libtifiles/trunk"

src_prepare() {
	eautoreconf
}

#src_prepare() {
#	cd src
#	sed -i -e "s|types\*.h|$(echo types*.h)|" Makefile.in || die
#	autotools-utils_src_prepare
#}

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
