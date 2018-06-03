# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit autotools-multilib eutils git-r3


DESCRIPTION="Open versatile codec designed for interactive speech and audio transmission over the internet"
HOMEPAGE="http://opus-codec.org/"
EGIT_REPO_URI="https://git.xiph.org/opus.git"
AUTOTOOLS_AUTORECONF="1"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~x86 ~amd64-fbsd"
IUSE="custom-modes doc"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

src_configure() {
		local myeconfargs=(
			$(use_enable custom-modes)
			$(use_enable doc)
		)
		autotools-multilib_src_configure
}
