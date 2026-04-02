# shell.nix
let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [ 
    pkgs.opam
  ];
  shellHook="
  opam init
  opam install forester
  eval $(opam env)
 ";
}
