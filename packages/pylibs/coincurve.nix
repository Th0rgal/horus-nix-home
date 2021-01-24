{ lib, pkg-config, buildPythonPackage, fetchPypi, requests, asn1crypto }:

buildPythonPackage rec {
  pname = "coincurve";
  version = "13.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1x8dpbq6bwswfyi1g4r421hnswp904l435rf7n6fj7y8q1yn51cr";
  };

  nativeBuildInputs = [ pkg-config ];
  propagatedBuildInputs = [ requests asn1crypto ];
  doCheck = false;

  meta = with lib; {
    homepage = "todo";
    description = "todo";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
  };
}