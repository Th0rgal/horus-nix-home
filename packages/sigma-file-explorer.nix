{ lib, fetchurl, makeDesktopItem, appimageTools, imagemagick }:

let
  pname = "sigma-file-manager";
  version = "1.3.0";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/aleksey-hoffman/${pname}/releases/download/v${version}/${name}-Linux-Debian.AppImage";
    sha256 = "1s0f8hh5xyigpm5ikl1f8mpzd94kj3sr18d9zi2x0m7yclxyc5pm";
  };

  appimageContents = appimageTools.extractType2 { inherit name src; };
in appimageTools.wrapType2 rec {
  inherit name src;

  extraInstallCommands = ''
    mv $out/bin/${name} $out/bin/${pname}
    install -m 444 -D ${appimageContents}/${pname}.desktop $out/share/applications/${pname}.desktop
    ${imagemagick}/bin/convert ${appimageContents}/${pname}.png -resize 512x512 ${pname}_512.png
    install -m 444 -D ${pname}_512.png $out/share/icons/hicolor/512x512/apps/${pname}.png
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun --no-sandbox %U' "Exec=$out/bin/${pname}"
  '';

  meta = with lib; {
    description = "Sigma File Manager";
    homepage = "https://github.com/aleksey-hoffman/sigma-file-manager";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
    platforms = [ "x86_64-linux" ];
  };
}