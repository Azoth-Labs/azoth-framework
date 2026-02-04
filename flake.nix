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
            cmake          # CMake build system
            ninja          # Ninja build system
            pkg-config     # pkg-config for finding libraries
            gdb            # GNU debugger
          ];
          buildInputs = with pkgs; [
            drogon         # C++ web framework
            nlohmann_json  # JSON library
            boost          # Boost libraries
            curl           # libcurl development headers and libraries
            sqlite         # SQLite development headers and libraries
          ];
        };
      });
}
