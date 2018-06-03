# Distributed under the terms of the GNU General Public License v2

inherit cvs eutils autotools flag-o-matic xdg-utils

DESCRIPTION="JAMin is the JACK Audio Connection Kit (JACK) Audio Mastering interface"
HOMEPAGE="http://jamin.sourceforge.net"
ECVS_SERVER="jamin.cvs.sourceforge.net:/cvsroot/jamin"
ECVS_MODULE="jamin"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="osc"

DEPEND="virtual/jack
	>=media-plugins/swh-plugins-0.4.6
	media-libs/ladspa-sdk
	>=sci-libs/fftw-3.0.1
	media-libs/libsndfile
	>=media-libs/alsa-lib-0.9.0
	>=dev-libs/libxml2-2.5.0
	>=x11-libs/gtk+-2.0.0
	osc? ( >=media-libs/liblo-0.5 )
	!media-sound/jamin-cvs"

S="${WORKDIR}/${ECVS_MODULE}"

src_prepare() {
	touch "${S}/aclocal.m4"
	cd "${S}"
	echo "no" | glib-gettextize --force-copy
	eaclocal
}

src_configure() {
	econf $(use_enable osc) || die "configure failed"
}

src_install() {
	emake install DESTDIR=${D} || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO
}

pkg_postinst() {
	default
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	default
	xdg_mimeinfo_database_update
}
