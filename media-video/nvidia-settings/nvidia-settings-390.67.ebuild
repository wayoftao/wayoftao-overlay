# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils multilib

DESCRIPTION="NVIDIA Linux X11 Settings Utility"
HOMEPAGE="http://www.nvidia.com/"
SRC_URI="https://github.com/NVIDIA/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
IUSE="gtk3"

RDEPEND="x11-drivers/nvidia-drivers
        dev-libs/jansson
        gtk3? (
            x11-libs/gtk+:3
        )
        x11-libs/gdk-pixbuf[X]
        x11-libs/gtk+:2
        x11-libs/libX11
        x11-libs/libXext
        x11-libs/libXrandr
        x11-libs/libXv
        x11-libs/libXxf86vm"
DEPEND="${RDEPEND}"
