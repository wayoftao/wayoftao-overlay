# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="X.Org DRI3 protocol specification and Xlib/Xserver headers"

KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="+abi_x86_32 +abi_x86_64"

RDEPEND=""
DEPEND="${RDEPEND}"
SLOT="0"


REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"
