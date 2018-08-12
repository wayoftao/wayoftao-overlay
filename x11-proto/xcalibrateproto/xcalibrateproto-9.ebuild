# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Touchscreen calibration protocol"
LICENSE="GPL-2"

KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~x86-fbsd"
IUSE="+abi_x86_32 +abi_x86_64"

RDEPEND=">x11-base/xorg-proto-2014.4-r1"
DEPEND="${RDEPEND}"
SLOT="0"


REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"
