# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="X.Org XF86DRI protocol headers"

KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE="+abi_x86_32 +abi_x86_64"

RDEPEND=">x11-base/xorg-proto-2014.4-r1"
DEPEND="${RDEPEND}"
SLOT="0"


REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"
