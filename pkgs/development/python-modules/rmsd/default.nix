{
  buildPythonPackage,
  lib,
  fetchPypi,
  scipy,
}:

buildPythonPackage rec {
  pname = "rmsd";
  version = "1.6.2";
  format = "setuptools";

  propagatedBuildInputs = [ scipy ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-E5QIJRqYivSeMxdSOGNt0sbJ6ExHcyLRZ91X6saduto=";
  };

  pythonImportsCheck = [ "rmsd" ];

  meta = with lib; {
    description = "Calculate root-mean-square deviation (RMSD) between two sets of cartesian coordinates";
    mainProgram = "calculate_rmsd";
    homepage = "https://github.com/charnley/rmsd";
    license = licenses.bsd2;
    platforms = platforms.linux;
    maintainers = with maintainers; [
      sheepforce
      markuskowa
    ];
  };
}
