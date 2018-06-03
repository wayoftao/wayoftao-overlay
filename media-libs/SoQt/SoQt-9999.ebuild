# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils autotools-utils mercurial

DESCRIPTION="The glue between Coin3D and Qt"
HOMEPAGE="https://bitbucket.org/Coin3D/soqt"
LICENSE="|| ( GPL-2 PEL )"
KEYWORDS=""
SLOT="0"
IUSE="qt4 debug doc static-libs"

RDEPEND="
	>=media-libs/coin-3.1.3
	virtual/opengl
	qt4? ( dev-qt/qtcore:4
		   dev-qt/qtgui:4
		   dev-qt/qtopengl:4 )
	!qt4? ( dev-qt/qtcore:5
			dev-qt/qtgui:5
			dev-qt/qtopengl:5 )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( app-doc/doxygen )
"

PATCHES=(
	"${FILESDIR}/${PN}-1.5.0-pkgconfig-partial.patch"
)

DOCS=(AUTHORS ChangeLog FAQ HACKING NEWS README)

src_unpack() {
	local TMPDIR="$(emktemp -d)"
	mercurial_fetch "https://bitbucket.org/Coin3D/generalmsvcgeneration" "generalmsvcgeneration" "${TMPDIR}/default"
	rm -r "${TMPDIR}"

	local TMPDIR="$(emktemp -d)"
	mercurial_fetch "https://bitbucket.org/Coin3D/soanydata" "soanydata" "${TMPDIR}/default"
	rm -r "${TMPDIR}"

	local TMPDIR="$(emktemp -d)"
	mercurial_fetch "https://bitbucket.org/Coin3D/sogui" "sogui" "${TMPDIR}/default"
	rm -r "${TMPDIR}"

	mercurial_fetch "https://bitbucket.org/peterl94/soqt"
	cd "${S}"
	hg update qt5
}

src_configure() {
	local myeconfargs=(
		htmldir="/usr/share/doc/${PF}/html"
		--disable-compact
		--disable-html-help
		--disable-loadlibrary
		--disable-man
		--enable-pkgconfig
		--includedir="/usr/include/coin"
		--with-coin
		$(use_with !qt4 qt5)
		$(use_enable debug)
		$(use_enable debug symbols)
		$(use_enable doc html)
	)
	autotools-utils_src_configure
}

src_install() {
	# Remove SoQt from Libs.private
	sed -e '/Libs.private/s/ -lSoQt//' -i "${BUILD_DIR}"/SoQt.pc || die

	autotools-utils_src_install
}
