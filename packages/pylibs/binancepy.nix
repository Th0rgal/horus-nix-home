{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.7.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "2f75944b0a0f86f1f7d3034095bfe2ef12dba24b70d2cb63490d5a537958dd88";
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
