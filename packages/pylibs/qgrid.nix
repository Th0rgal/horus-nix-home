{ lib, buildPythonPackage, fetchPypi, pandas, ipywidgets, pytest }:

buildPythonPackage rec {
  pname = "qgrid";
  version = "1.3.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "fe8af5b50833084dc0b6a265cd1ac7b837c03c0f8521150163560dce778d711c";
  };

  propagatedBuildInputs = [ pandas ipywidgets ];
  doCheck = false;
}
