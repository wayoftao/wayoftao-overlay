# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

MY_PN="OpenBLAS"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="An optimized BLAS library based on GotoBLAS2 1.13 BSD version."
HOMEPAGE="https://www.openblas.net"
SRC_URI="https://github.com/xianyi/OpenBLAS/archive/v${PV}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="*"
IUSE="+cblas"

DEPEND="dev-util/cmake"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_test() {
	# Run all tests
	emake tests lapack-test blas-test
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_WITHOUT_CBLAS=$(usex !cblas)
	)

	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	insinto /etc/env.d/blas/$(get_libdir)
	newins "${FILESDIR}/openblas.blas.eselect.envd" "openblas"

	if $(use cblas);  then
		insinto /etc/env.d/cblas/$(get_libdir)
		newins "${FILESDIR}/openblas.cblas.eselect.envd" "openblas"
	fi
}
