# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="An FT2 compatible music tracker"
HOMEPAGE="http://milkytracker.titandemo.org/"

EGIT_REPO_URI="https://github.com/milkytracker/Milkytracker.git"
EGIT_SUBMODULES=( lhasa )

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="jack midi +zip"

DEPEND="dev-util/cmake
		app-text/xmlto
		media-libs/libsdl2
		jack? ( virtual/jack )
		midi? ( media-libs/alsa-lib
				media-libs/rtmidi )
		zip?  ( sys-libs/zlib
			    dev-libs/zziplib )"
RDEPEND="${DEPEND}"
