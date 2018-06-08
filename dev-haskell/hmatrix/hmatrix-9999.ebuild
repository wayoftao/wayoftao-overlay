# Distributed under the terms of the GNU General Public License v2

EAPI=6

CABAL_FEATURES="haddock hoogle hscolour lib profile"

inherit git-r3 haskell-cabal

DESCRIPTION="Numeric Linear Algebra"
HOMEPAGE="http://hackage.haskell.org/package/hmatrix"
EGIT_REPO_URI="https://github.com/albertoruiz/hmatrix.git"

LICENSE="BSD-3"
SLOT="0/${PV}"
KEYWORDS=""
IUSE=""

S="${S}/packages/base"

DEPEND="virtual/blas
		virtual/lapack
		dev-lang/ghc
		dev-haskell/storable-complex:=[profile?]
		>=dev-haskell/vector-0.8:=[profile?]
		dev-haskell/semigroups:=[profile?]
		dev-haskell/random:=[profile?]
		dev-haskell/split:=[profile?]
		dev-haskell/binary:=[profile?]"
RDEPEND="${DEPEND}
		>=dev-haskell/cabal-1.22.2.0"
