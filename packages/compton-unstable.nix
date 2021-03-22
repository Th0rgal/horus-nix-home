{ stdenv, fetchFromGitHub, meson, ninja, pkgconfig, cmake, libev, libX11
, xcbutilrenderutil, xcbutilimage, libXext, pixman, uthash, libconfig, pcre
, libGL, dbus }:

stdenv.mkDerivation {
  pname = "compton-unstable";
  version = "2019-12-20";

  src = fetchFromGitHub {
    owner = "tryone144";
    repo = "compton";
    rev = "75dd1053cae2e1609e096b12943c6bef22b8a4a9";
    sha256 = "0ri8i8a4zf0qnr53xhkrm38di9abgq1rz36p9m22sxg56iy71aqn";
  };

  installFlags = [ "PREFIX=$(out)" ];

  nativeBuildInputs = [ meson ninja pkgconfig cmake uthash ];

  buildInputs = [
    libev
    libX11
    xcbutilrenderutil
    xcbutilimage
    libXext
    pixman
    libconfig
    pcre
    libGL
    dbus
  ];
}
