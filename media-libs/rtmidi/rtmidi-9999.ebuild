# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils multilib git-r3 flag-o-matic

append-ldflags "-lrtmidi"

DESCRIPTION="RtMidi provides a common C++ API for realtime MIDI input/output across ALSA and JACK."
HOMEPAGE="http://www.music.mcgill.ca/~gary/rtmidi/"
EGIT_REPO_URI="https://github.com/thestk/rtmidi.git"

LICENSE="Rt-Midi"
SLOT="0"
KEYWORDS="~*"
IUSE="+alsa doc +jack"
RDEPEND="alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )"

DEPEND="${RDEPEND}"

src_prepare() {
	#epatch "${FILESDIR}/${P}_buildsystem.patch"
	eautoreconf
	default
}

src_configure() {
	econf --libdir="/usr/$(get_libdir)" \
	$(use_with alsa) \
	$(use_with jack) || die "./configure failed"
}

src_compile() {
	emake -j1 || die "make failed"
}

src_install() {
	dodoc README.md
	if use doc; then
		dodoc doc/release.txt
		dohtml doc/html/*
	fi
	insinto /usr/$(get_libdir)/pkgconfig
	doins rtmidi.pc
	#insinto /usr/include
	#doins RtMidi.h RtError.h
	default
}
