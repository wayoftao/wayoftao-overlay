# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGIT_REPO_URI="https://github.com/NVIDIA/${PN}.git"

if [[ ${PV} = 9999* ]]; then
	GIT_ECLASS="git-r3"
fi

PYTHON_COMPAT=( python2_7 )
inherit autotools ${GIT_ECLASS} multilib-minimal python-any-r1

DESCRIPTION="The GL Vendor-Neutral Dispatch library"
HOMEPAGE="https://github.com/NVIDIA/libglvnd"
if [[ ${PV} = 9999* ]]; then
	SRC_URI=""
else
	KEYWORDS="~amd64"
	COMMIT="9d909106f232209cf055428cae18387c18918704"
	SRC_URI="https://github.com/NVIDIA/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/${PN}-${COMMIT}
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
	!media-libs/mesa[-glvnd(-)]
	x11-libs/libX11[${MULTILIB_USEDEP}]
	"
DEPEND="${PYTHON_DEPS}
	${RDEPEND}
	>x11-base/xorg-proto-2018.4-r1
	x11-libs/libXext"

src_unpack() {
	default
	[[ $PV = 9999* ]] && git-r3_src_unpack
}

src_prepare() {
	default
	eautoreconf
}

multilib_src_configure() {
	ECONF_SOURCE=${S} econf
}

multilib_src_install() {
	default
	# libglvnd should replace existing Mesa gl if present
	PKGCONF_PATH="${ED}/usr/$(get_libdir)/pkgconfig"
	sed -i -e 's/Libs:/Libs: -lGL -lGLX/' "${PKGCONF_PATH}/libglvnd.pc"
	ln -fs "${PKGCONF_PATH}/libglvnd.pc" "${PKGCONF_PATH}/gl.pc" || die
	find "${ED}" -name '*.la' -delete || die
}
