# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 meson

DESCRIPTION="X.Org combined proto-9col headers" # FL-4990, https://bugs.freedesktop.org/show_bug.cgi?id=105287
HOMEPAGE="https://cgit.freedesktop.org/xorg/proto/xorgproto/"
EGIT_REPO_URI="https://anongit.freedesktop.org/git/xorg/proto/xorgproto"
EGIT_COMMIT="af9b5f43439378efd1e12d11d487a71f42790fec"

LICENSE="GPL-2 MIT SGI-B-2.0"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 ~hppa ia64 ~mips ppc ppc64 ~sh sparc x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="legacy"

DEPEND="
    !<x11-proto/bigreqsproto-9
    !<x11-proto/compositeproto-9
    !<x11-proto/damageproto-9
    !<x11-proto/dmxproto-9
    !<x11-proto/dri2proto-9
    !<x11-proto/dri3proto-9
    !<x11-proto/fixesproto-9
    !<x11-proto/fontcacheproto-9
    !<x11-proto/fontsproto-9
    !<x11-proto/glproto-9
    !<x11-proto/inputproto-9
    !<x11-proto/kbproto-9
    !<x11-proto/presentproto-9
    !<x11-proto/printproto-9
    !<x11-proto/randrproto-9
    !<x11-proto/recordproto-9
    !<x11-proto/renderproto-9
    !<x11-proto/resourceproto-9
    !<x11-proto/scrnsaverproto-9
    !<x11-proto/trapproto-9
    !<x11-proto/videoproto-9
    !<x11-proto/xcalibrateproto-9
    !<x11-proto/xcmiscproto-9
    !<x11-proto/xextproto-9
    !<x11-proto/xf86bigfontproto-9
    !<x11-proto/xf86dgaproto-9
    !<x11-proto/xf86driproto-9
    !<x11-proto/xf86miscproto-9
    !<x11-proto/xf86rushproto-9
    !<x11-proto/xf86vidmodeproto-9
    !<x11-proto/xineramaproto-9
    !<x11-proto/xproto-9"
LEGACY_BLOCKS="
	!<x11-proto/evieproto-1.1.1-r10
	!<x11-proto/fontcacheproto-0.1.3-r10
	!<x11-proto/lg3dproto-5.0-r10
	!<x11-proto/printproto-1.0.5-r10
	!<x11-proto/xcalibrateproto-0.1.0-r10
	!<x11-proto/xf86rushproto-1.2.2-r10"
RDEPEND="legacy? ( ${LEGACY_BLOCKS} )
	!<x11-proto/applewmproto-1.4.2-r10
	!<x11-proto/bigreqsproto-1.1.2-r10
	!<x11-proto/compositeproto-0.4.2-r10
	!<x11-proto/damageproto-1.2.1-r10
	!<x11-proto/dmxproto-2.3.1-r10
	!<x11-proto/dri2proto-2.8-r10
	!<x11-proto/dri3proto-1.2-r10
	!<x11-proto/fixesproto-5.0-r10
	!<x11-proto/fontsproto-2.1.3-r10
	!<x11-proto/glproto-1.4.17-r10
	!<x11-proto/inputproto-2.3.2-r10
	!<x11-proto/kbproto-1.0.7-r10
	!<x11-proto/presentproto-1.2-r10
	!<x11-proto/randrproto-1.6.0-r10
	!<x11-proto/recordproto-1.14.2-r10
	!<x11-proto/renderproto-0.11.1-r10
	!<x11-proto/resourceproto-1.2.0-r10
	!<x11-proto/scrnsaverproto-1.2.2-r10
	!<x11-proto/trapproto-3.4.3-r10
	!<x11-proto/videoproto-2.3.3-r10
	!<x11-proto/windowswmproto-1.0.4-r10
	!<x11-proto/xcmiscproto-1.2.2-r10
	!<x11-proto/xextproto-7.3.0-r10
	!<x11-proto/xf86bigfontproto-1.2.0-r10
	!<x11-proto/xf86dgaproto-2.1-r10
	!<x11-proto/xf86driproto-2.1.1-r10
	!<x11-proto/xf86miscproto-0.9.3-r10
	!<x11-proto/xf86vidmodeproto-2.3.1-r10
	!<x11-proto/xineramaproto-1.2.1-r10
	!<x11-proto/xproto-7.0.32-r10
	!<x11-proto/xproxymngproto-1.0.3-r10"
LEGACY_DEPS="
	=x11-proto/evieproto-1.1.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/fontcacheproto-0.1.3-r10[${MULTILIB_USEDEP}]
	=x11-proto/lg3dproto-5.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/printproto-1.0.5-r10[${MULTILIB_USEDEP}]
	=x11-proto/xcalibrateproto-0.1.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86rushproto-1.2.2-r10[${MULTILIB_USEDEP}]"
PDEPEND="legacy? ( ${LEGACY_DEPS} )
	=x11-proto/applewmproto-1.4.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/bigreqsproto-1.1.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/compositeproto-0.4.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/damageproto-1.2.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/dmxproto-2.3.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/dri2proto-2.8-r10[${MULTILIB_USEDEP}]
	=x11-proto/dri3proto-1.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/fixesproto-5.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/fontsproto-2.1.3-r10[${MULTILIB_USEDEP}]
	=x11-proto/glproto-1.4.17-r10[${MULTILIB_USEDEP}]
	=x11-proto/inputproto-2.3.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/kbproto-1.0.7-r10[${MULTILIB_USEDEP}]
	=x11-proto/presentproto-1.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/randrproto-1.6.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/recordproto-1.14.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/renderproto-0.11.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/resourceproto-1.2.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/scrnsaverproto-1.2.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/trapproto-3.4.3-r10[${MULTILIB_USEDEP}]
	=x11-proto/videoproto-2.3.3-r10[${MULTILIB_USEDEP}]
	=x11-proto/windowswmproto-1.0.4-r10[${MULTILIB_USEDEP}]
	=x11-proto/xcmiscproto-1.2.2-r10[${MULTILIB_USEDEP}]
	=x11-proto/xextproto-7.3.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86bigfontproto-1.2.0-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86dgaproto-2.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86driproto-2.1.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86miscproto-0.9.3-r10[${MULTILIB_USEDEP}]
	=x11-proto/xf86vidmodeproto-2.3.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/xineramaproto-1.2.1-r10[${MULTILIB_USEDEP}]
	=x11-proto/xproto-7.0.32-r10[${MULTILIB_USEDEP}]
	=x11-proto/xproxymngproto-1.0.3-r10[${MULTILIB_USEDEP}]"
