{ lib, buildPythonPackage, fetchPypi, aiohttp, pytest }:

buildPythonPackage rec {
  pname = "binance.py";
  version = "1.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "01m9xl7yjign59kclgnzlpmn0laps193nsrvajjashzbznp374k4";
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
