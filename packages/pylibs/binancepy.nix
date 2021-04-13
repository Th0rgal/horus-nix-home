{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.7.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "051fm3d6qrd1fvqc23ia5chnhynfxqkfl7kwpvjllgbph16yz13g";
  };

  propagatedBuildInputs = [ aiohttp ];
  checkInputs = [ pytest ];

  meta = with lib; {
    homepage = "https://git.io/binance.py";
    description =
      "A python3 binance API (v3) wrapper powered by modern technologies such as asyncio. The project aims to rival python-binance.";
    license = licenses.mit;
    maintainers = with maintainers; [ th0rgal ];
  };
}
