# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 meson

DESCRIPTION="X.Org combined proto-9col headers" # FL-4990, https://bugs.freedesktop.org/show_bug.cgi?id=105287
HOMEPAGE="https://cgit.freedesktop.org/xorg/proto/xorgproto/"
EGIT_REPO_URI="https://anongit.freedesktop.org/git/xorg/proto/xorgproto"

LICENSE="GPL-2 MIT SGI-B-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

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
