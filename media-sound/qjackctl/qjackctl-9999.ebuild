# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit qmake-utils autotools git-r3 gnome2-utils

DESCRIPTION="A Qt application to control the JACK Audio Connection Kit and ALSA sequencer connections."
HOMEPAGE="http://qjackctl.sourceforge.net/"
EGIT_REPO_URI="https://github.com/rncbc/qjackctl.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE="alsa dbus debug portaudio -qt4"

RDEPEND="
	virtual/jack
	!qt4? ( dev-qt/qtcore:5
			dev-qt/qtgui:5 )
	qt4?  ( dev-qt/qtcore:4
			dev-qt/qtgui:4 )
	alsa? ( media-libs/alsa-lib )
	dbus? ( 
			!qt4? ( dev-qt/qtdbus:5 )
			qt4? ( dev-qt/qtdbus:4 ) )
	portaudio? ( media-libs/portaudio )"
DEPEND="${RDEPEND}"

DOCS="AUTHORS ChangeLog README TODO TRANSLATORS"

src_prepare() {
	eautoreconf
}

src_configure() {
	if $(use qt4); then
		PATH="$(qt4_get_bindir):${PATH}"
	else
		PATH="$(qt5_get_bindir):${PATH}"
	fi

	econf $(use_enable alsa alsa-seq) \
			$(use_enable dbus) \
			$(use_enable debug) \
			$(use_enable portaudio) \
			$(use_enable qt4)
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

