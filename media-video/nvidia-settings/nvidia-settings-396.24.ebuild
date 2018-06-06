# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib

DESCRIPTION="NVIDIA Linux X11 Settings Utility"
HOMEPAGE="http://www.nvidia.com/"
SRC_URI="https://download.nvidia.com/XFree86/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
IUSE="dbus vdpau gtk3"

RDEPEND="x11-drivers/nvidia-drivers
        dev-libs/jansson
        x11-libs/gdk-pixbuf[X]
        x11-libs/libX11
        x11-libs/libXext
        x11-libs/libXrandr
        x11-libs/libXv
        x11-libs/libXxf86vm
        gtk3? ( x11-libs/gtk+:3 )
        !gtk3? ( x11-libs/gtk+:2 )
        dbus? ( sys-apps/dbus )
        vdpau? ( x11-libs/libvdpau )"
DEPEND="${RDEPEND}"

src_prepare() {
    epatch "${FILESDIR}/nvidia-settings-gtk-independence.patch"
}
