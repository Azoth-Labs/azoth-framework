{
  description = "Azoth Framework Development Environment";
  nixConfig.bash-prompt = "[nix-dev]λ ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            gdb
          ];
          buildInputs = with pkgs; [
            drogon
            nlohmann_json
            boost
            curl
            sqlite
          ];
        };
      });
}
