# Distributed under the terms of the GNU General Public License v2

EAPI=6 
inherit git-r3 qmake-utils

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/shundhammer/qdirstat"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtcore:5
		dev-qt/qtwidgets:5
		sys-libs/zlib"
RDEPEND="${DEPEND}"

src_configure() {
	eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
