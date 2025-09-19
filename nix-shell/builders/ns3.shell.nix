{ pkgs }:

pkgs.mkShell {
  # 未調整
  name = "pythonenv";
  venvDir = "/home/frse/.venv";
  buildInputs = with pkgs; [
    libgcc
    cmake
    boost
    python3
    python3Packages.pip
    python3Packages.venvShellHook
  ];

  # 未調整:
  postVenvCreation = ''
    pip install cppyy
  '';
  
}
