# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="An FT2 compatible music tracker"
HOMEPAGE="http://milkytracker.github.io/"

STYLIZED_PN="MilkyTracker"
SRC_URI="https://github.com/milkytracker/${PN}/${STYLIZED_PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~*"
IUSE="jack midi +zip"

DEPEND="dev-util/cmake
		app-text/xmlto
		media-libs/libsdl2
		jack? ( media-sound/jack-audio-connection-kit )
		midi? ( media-libs/alsa-lib
				media-libs/rtmidi )
		zip?  ( sys-libs/zlib
			    dev-libs/zziplib )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${STYLIZED_PN}-${PV}"

src_prepare() {
	rm -r ${S}/src/submodules/{rtaudio,zlib,zziplib}
	default
}
