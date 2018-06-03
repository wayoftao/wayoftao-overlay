# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit git-r3 distutils-r1 eutils virtualx

DESCRIPTION="Python ctype-based wrapper around libusb1 "
HOMEPAGE="https://github.com/vpelletier/python-libusb1"
EGIT_REPO_URI="https://github.com/vpelletier/python-libusb1.git"

LICENSE="LGPL"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/libusb"
