# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="haddock hoogle hscolour lib"

inherit git-r3 haskell-cabal autotools

DESCRIPTION="Haskell BLAS bindings"
HOMEPAGE="https://github.com/patperry/hs-linear-algebra"
EGIT_REPO_URI="https://github.com/mikeizbicki/hs-linear-algebra.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=">=dev-haskell/quickcheck-2.1.1
		>=dev-haskell/test-framework-quickcheck2-0.2.7
		>=dev-haskell/vector-0.7
		dev-haskell/ieee754
		dev-haskell/storable-complex"
RDEPEND="${DEPEND}
		virtual/cblas
		dev-lang/ghc"

src_prepare() {
	eautoreconf
	default
}
