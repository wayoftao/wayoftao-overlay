# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils eutils git-2

EGIT_REPO_URI="https://github.com/keepassx/keepassx"

DESCRIPTION="Qt password manager compatible with its Win32 and Pocket PC versions"
HOMEPAGE="http://www.keepassx.org/"
[[ ${PV} = 9999 ]] || SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
[[ ${PV} = 9999 ]] || KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="c++0x"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtdbus:5
	dev-qt/qttest:5
	dev-qt/qtconcurrent:5
	dev-qt/linguist-tools:5"

RDEPEND="${DEPEND}
	dev-util/cmake"


src_prepare() {
	#epatch "${FILESDIR}/sdl2-image.patch"
	#[[ ${PV} = 9999 ]] && eautoreconf
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_TESTS=OFF
		-DWITH_GUI_TESTS=OFF
		$(cmake-utils_use_with c++0x CXX11)
		)

	cmake-utils_src_configure
}
