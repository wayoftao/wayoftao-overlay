# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit cmake-utils games git-r3

DESCRIPTION="A cross-platform, open source, and super fast MUD client with scripting in Lua "
HOMEPAGE="http://mudlet.org/"
EGIT_REPO_URI="https://github.com/Mudlet/Mudlet.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 hppa ppc sparc x86 ~x86-fbsd"
IUSE="sql"

DEPEND="dev-qt/qtcore
	dev-qt/qtopengl
	dev-qt/designer
	>=dev-lang/lua-5.1
	dev-lua/lua-zlib
	dev-lua/luafilesystem
	sql? ( dev-db/sqlite )
	>=dev-libs/libpcre-7.8
	app-text/hunspell
	dev-libs/yajl
	dev-libs/libzip
	sys-libs/zlib
	dev-libs/zziplib"
RDEPEND="${DEPEND}
		dev-util/cmake"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with sql SQL)
	)
	cmake-utils_src_configure $mycmakeargs
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cd ${BUILD_DIR}/src
	dogamesbin ${PN}

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
}

pkg_postinst() {
	games_pkg_postinst
}
