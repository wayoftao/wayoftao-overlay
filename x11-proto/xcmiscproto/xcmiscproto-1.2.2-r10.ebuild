# Distributed under the terms of the GNU General Public License v2
EAPI=6

inherit multilib-minimal

DESCRIPTION="X.Org Protocol xcmiscproto-1.2.2 package stub (provided by xorg-proto)."

KEYWORDS="*"

SLOT="0"

RDEPEND=" || (
	=x11-base/xorg-proto-2018.8_p99999999[${MULTILIB_USEDEP}]
)"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

multilib_src_configure() { return 0; }
src_configure() { return 0; }
multilib_src_compile() { return 0; }
src_compile() { return 0; }
multilib_src_install() { return 0; }
src_install() { return 0; }

