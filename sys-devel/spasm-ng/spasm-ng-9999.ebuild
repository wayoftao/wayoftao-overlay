# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="SPASM-ng is a z80 assembler with extra features to support development for TI calculators."
HOMEPAGE="https://github.com/alberthdev/spasm-ng"
EGIT_REPO_URI="https://github.com/alberthdev/spasm-ng.git"

[[ ${PV} = 9999 ]] || SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
[[ ${PV} = 9999 ]] || KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="sign"

DEPEND="sign? ( dev-libs/openssl )
		sign? ( dev-libs/gmp )"
RDEPEND="${DEPEND}"

src_compile() {
	if use sign; then
		emake
	else
		emake NO_APPSIGN=1
	fi
}

src_install() {
	dobin spasm
}
