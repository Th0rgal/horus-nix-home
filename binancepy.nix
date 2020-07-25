{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e3afba02102b94e407786f460aa0dfc01337591c32afa68455ae4e4c6d17a41f";
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