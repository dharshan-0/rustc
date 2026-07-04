{
  description = "Fenix Rust Nightly Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fenix.url = "github:nix-community/fenix";
  };

  outputs = {
    nixpkgs,
    fenix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        (fenix.packages.${system}.complete.withComponents
          [
            "rustc-dev"
            "cargo"
            "rustc"
            "llvm-tools"
          ])
      ];
    };
  };
}
