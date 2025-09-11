{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    libgcc
    cmake
    boost
  ];
  shellHook = ''
    echo "++GCC CMAKE SHELL++(Latest)";
  '';
}

