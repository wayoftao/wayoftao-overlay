# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="haddock hoogle hscolour lib"

inherit git-r3 haskell-cabal autotools

DESCRIPTION="Numeric Linear Algebra"
HOMEPAGE="http://hackage.haskell.org/package/hmatrix"
EGIT_REPO_URI="https://github.com/albertoruiz/hmatrix.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/cblas
		virtual/lapack
		>=dev-haskell/storable-complex-0.2.0
		>=dev-haskell/vector-0.1.0
		>=dev-haskell/primitive-0.5
		dev-haskell/semigroups
		"
RDEPEND="${DEPEND}
		dev-lang/ghc"
