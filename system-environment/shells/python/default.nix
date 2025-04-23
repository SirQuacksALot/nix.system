let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [
    (pkgs.pyhton3.withPackages.(python-pkgs: [
      python-pkgs.requests
      python-pkgs.pyquery   # needed for weather scripts
      python-pkgs.pip
    ]))
  ];
}