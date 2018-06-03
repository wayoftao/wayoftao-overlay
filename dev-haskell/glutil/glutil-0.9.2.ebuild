# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="GLUtil"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Miscellaneous OpenGL utilities"
HOMEPAGE="http://hackage.haskell.org/package/GLUtil"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/juicypixels-3:=[profile?]
	>=dev-haskell/linear-1.1.3:=[profile?]
	>=dev-haskell/opengl-3:=[profile?] <dev-haskell/opengl-3.1:=[profile?]
	>=dev-haskell/openglraw-3.0:=[profile?] <dev-haskell/openglraw-3.3:=[profile?]
	>=dev-haskell/vector-0.7:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	dev-haskell/cpphs
	dev-haskell/hpp
"

S="${WORKDIR}/${MY_P}"
