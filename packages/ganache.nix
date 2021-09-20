{ lib, fetchurl, makeDesktopItem, appimageTools, imagemagick }:

let
  pname = "Ganache";
  version = "2.5.4";
  name = "${pname}-${version}";

  src = fetchurl {
    url =
      "https://github.com/trufflesuite/ganache-ui/releases/download/v${version}/${name}-linux-x86_64.AppImage";
    sha256 = "f5ed8c1088e5253b79d63cbe2f9cf8615c9e8a125844d95db83f5023053c9e8f";
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
      --replace 'Exec=AppRun' "Exec=$out/bin/${pname}"
  '';

  meta = with lib; {
    description = "Ganache";
    homepage = "https://github.com/trufflesuite/ganache-ui";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
    platforms = [ "x86_64-linux" ];
  };
}
