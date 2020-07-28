{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7a2086731419720a460520a2470055d802b3f49638d5f235d80b7d180afe34e4";
  };

  propagatedBuildInputs = [aiohttp];
  checkInputs = [ pytest ];

  meta = with lib; {
    homepage = "https://git.io/binance.py";
    description = "A python3 binance API (v3) wrapper powered by modern technologies such as asyncio. The project aims to rival python-binance.";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
  };
}