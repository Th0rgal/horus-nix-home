with import <nixpkgs> {};
with xorg;

stdenv.mkDerivation rec {
  name = "compton-tryone";
  version = "241bbc5";
  
  COMPTON_VERSION = "v${version}";
  
  src = builtins.fetchGit {
    url = "https://github.com/Litarvan/compton.git";
    rev = "d9d7d1d38c021297eb488c8c5f18156a49563dce";
    ref = "dual_kawase";
  };
  
  nativeBuildInputs = [
    pkg-config gnumake xorgproto git
    asciidoc docbook_xml_dtd_45 docbook_xsl
  ];
  
  buildInputs = [
    libX11 libXcomposite libXdamage libXfixes libXext
    libXrender libXrandr libXinerama xwininfo xprop
    pcre libconfig libdrm libGL dbus libxml2 libxslt
  ];
  
  preBuild = ''
    git() { echo "$COMPTON_VERSION"; }
    export -f git
  '';
  
  installFlags = [ "PREFIX=$(out)" ];
}
