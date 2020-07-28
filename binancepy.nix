{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "e202b082f57b963386dee085151f57170a1e7cd1754468713f7255fb6c51720a";
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