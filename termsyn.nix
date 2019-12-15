with import <nixpkgs> {};

let
  version = "1.8.6";
in
  fetchzip rec {
    name = "termsyn-${version}";
    url = "mirror://sourceforge/project/termsyn/termsyn-${version}.tar.gz";
    
    postFetch = ''
      mkdir -p $out/share/fonts/locale
      tar -xf $downloadedFile -C $out
      mv $out/termsyn-${version}/* $out/share/fonts/locale
      rm -r $out/termsyn-${version} $out/share/fonts/locale/README.termsyn
    '';
    
    sha256 = "1j6hn3nlfb83pvjw9h8r8mi4bhx8b0s3zrcqzj8pa631iv08vif6";
    
    meta = {
      homepage = "https://sourceforge.net/projects/termsyn/";
      description = "Monospaced font based on terminus and tamsyn";
      license = lib.licenses.gpl2;
    };
  }

