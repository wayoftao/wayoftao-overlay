# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit eutils toolchain-funcs flag-o-matic games

DESCRIPTION="The ultimate old-school single player dungeon exploration game"
HOMEPAGE="http://sourceforge.net/projects/unnethack/"
SRC_URI="mirror://sourceforge/unnethack/${PN}-${PV}-20131208.tar.gz"

LICENSE="unnethack"
SLOT="0"
KEYWORDS="amd64 hppa ppc sparc x86 ~x86-fbsd"
IUSE="X"

RDEPEND=">=sys-libs/ncurses-5.2-r5
	X? (
		x11-libs/libXaw
		x11-libs/libXpm
		x11-libs/libXt
	)"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	X? (
		x11-proto/xproto
		x11-apps/bdftopcf
		x11-apps/mkfontdir
	)"

S="${WORKDIR}/${PN}-${PV}-20131208"

src_configure() {
	egamesconf "$(use_enable X x11-graphics)"
}
