# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="haddock hoogle hscolour lib"

inherit git-r3 haskell-cabal autotools

DESCRIPTION="Human friendly BLAS and Lapack bindings for Haskell"
HOMEPAGE="http://hackage.haskell.org/package/hblas"
EGIT_REPO_URI="https://github.com/wellposed/hblas.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/cblas
		virtual/lapack
		>=dev-haskell/storable-complex-0.2.0
		>=dev-haskell/vector-0.1.0
		>=dev-haskell/primitive-0.5"
RDEPEND="${DEPEND}
		dev-lang/ghc"
