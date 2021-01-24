{ lib, buildPythonPackage, callPackage, fetchPypi, requests, coincurve ? (callPackage ./coincurve.nix { }) }:

buildPythonPackage rec {
  pname = "bit";
  version = "0.7.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1xc4x0csm7258dc0l13by23bl6a4rvy3d3y2ldms8qh443jy78j8";
  };

  propagatedBuildInputs = [ requests coincurve ];
  doCheck = false;

  meta = with lib; {
    homepage = "todo";
    description = "todo";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
  };
}