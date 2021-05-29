# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome.org meson virtualx

DESCRIPTION="GtkSourceView-based text editors and IDE helper library"
HOMEPAGE="https://wiki.gnome.org/Projects/Tepl"

LICENSE="LGPL-2.1+"
SLOT="6"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc x86"
IUSE="gtk-doc"
RESTRICT="!test? ( test )"

RDEPEND="
	app-i18n/uchardet
	>=dev-libs/glib-2.64:2
	>=dev-libs/gobject-introspection-1.42:=
	dev-libs/icu:=
	>=dev-libs/libxml2-2.5:2
	>=gui-libs/amtk-5.0:5[introspection]
	>=x11-libs/gtk+-3.22:3[introspection]
	>=x11-libs/gtksourceview-4.0:4[introspection]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/glib-utils
	>=dev-util/gtk-doc-am-1.25
	>=sys-devel/gettext-0.19.6
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		$(meson_use gtk-doc gtk_doc)
	)
	meson_src_configure
}

src_test() {
	virtx meson_src_test
}
