# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit qmake-utils git-r3

EGIT_REPO_URI="https://github.com/CE-Programming/CEmu.git"

DESCRIPTION="A developer-oriented emulator of the eZ80-based TI-84 Plus CE / TI-83 Premium CE calculators."
HOMEPAGE="https://github.com/CE-Programming/CEmu"
[[ ${PV} = 9999 ]] || SRC_URI=""

LICENSE=""
SLOT="0"
[[ ${PV} = 9999 ]] || KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-qt/qtcore:5
		dev-qt/qtgui:5"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/gui/qt/"

src_compile() {
	eqmake5 -r CEmu.pro
	emake
}

src_install() {
	dobin CEmu
}
