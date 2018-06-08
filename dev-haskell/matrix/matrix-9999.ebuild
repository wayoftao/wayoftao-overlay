# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="haddock hoogle hscolour lib"

inherit git-r3 haskell-cabal

DESCRIPTION="A native implementation of matrix operations"
HOMEPAGE="https://hackage.haskell.org/package/matrix"
EGIT_REPO_URI="https://github.com/Daniel-Diaz/matrix.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-haskell/loop-0.2
		>=dev-haskell/semigroups-0.9
		>=dev-haskell/vector-0.1.0
		>=dev-haskell/primitive-0.5"
RDEPEND="${DEPEND}
		dev-lang/ghc"
