# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )

inherit python-single-r1 git-r3

DESCRIPTION="Small command-line program to download videos from svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/aftonbladet"
HOMEPAGE="https://svtplay-dl.se"
EGIT_REPO_URI="https://github.com/spaam/svtplay-dl.git"

[[ ${PV} = 9999 ]] || SRC_URI=""

LICENSE="MIT"
SLOT="0"
[[ ${PV} = 9999 ]] || KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""


DEPEND=">=media-video/rtmpdump-2.4
		dev-python/pycryptodome
		dev-python/requests
		virtual/ffmpeg"
RDEPEND="${DEPEND}"
