# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit fortran-2

MY_PN="OpenBLAS"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="An optimized BLAS library based on GotoBLAS2 1.13 BSD version."
HOMEPAGE="https://www.openblas.net"
SRC_URI="https://github.com/xianyi/OpenBLAS/archive/v${PV}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="*"
IUSE="+cblas openmp static"

DEPEND="
	openmp? ( ||
				( sys-devel/gcc[openmp] )
				( sys-libs/libomp )
			)"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_test() {
	# Run all tests
	emake USE_OPENMP=$(use openmp) tests lapack-test blas-test
}

src_compile() {
	local mymakeargs=(
		USE_OPENMP=$(use openmp)
		BUILD_WITHOUT_CBLAS=$(use !cblas)
		BUILD_SHARED_LIBS=$(use !static)
	)
	emake $mymakeargs
}

src_install() {
	emake "PREFIX=${ED}/usr" install
	einstalldocs

	mv "${ED}/usr/lib" "${ED}/usr/$(get_libdir)"

	if $(use static); then BUILD_TYPE="static"; else BUILD_TYPE="shared"; fi

	insinto /etc/env.d/blas/$(get_libdir)
	newins "${FILESDIR}/openblas.${BUILD_TYPE}.blas.eselect.envd" "openblas"

	if $(use cblas); then
		insinto /etc/env.d/cblas/$(get_libdir)
		newins "${FILESDIR}/openblas.${BUILD_TYPE}.cblas.eselect.envd" "openblas"
	fi
}
