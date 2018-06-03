# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit git-r3 distutils-r1 eutils virtualx

DESCRIPTION="Standalone Steam Controller Driver"
HOMEPAGE="https://github.com/ynsta/steamcontroller"
EGIT_REPO_URI="https://github.com/ynsta/steamcontroller.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/libusb1[${PYTHON_USEDEP}]
		 dev-python/psutil[${PYTHON_USEDEP}]"
