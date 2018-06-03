# Distributed under the terms of the GNU General Public License v2

EAPI=5

AUTOTOOLS_IN_SOURCE_BUILD=1
inherit autotools-utils git-r3

DESCRIPTION="Communication program for Texas Instruments calculators "
HOMEPAGE="http://lpg.ticalc.org/prj_tilp"
EGIT_REPO_URI="https://github.com/debrouxl/tilp_and_gfm.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="nls threads xinerama"

S="${WORKDIR}/${P}/tilp/trunk"

RDEPEND="
	dev-libs/glib:2
	gnome-base/libglade:2.0
	x11-libs/gtk+:2
	>=sci-libs/libticalcs2-1.1.8
	>=sci-libs/libticables2-1.3
	>=sci-libs/libtifiles2-1.1.6
	>=sci-libs/libticonv-1.1.5
	nls? ( virtual/libintl )
	xinerama? ( x11-libs/libXinerama )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )
	xinerama? ( x11-proto/xineramaproto )"

src_prepare() {
	eautoreconf
}

src_configure() {
	# kde seems to be kde3 only
	local myeconfargs=(
		--disable-rpath
		--without-kde
		$(use_enable nls)
		$(use_enable threads threading)
		$(use_with xinerama)
	)
	
	autotools-utils_src_configure
}
