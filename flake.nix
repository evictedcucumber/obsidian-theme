{
  description = "AnuPpuccin Obsidian theme";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      # `nix develop` gives a shell with everything `make build` needs.
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.dart-sass
            pkgs.gnumake
            pkgs.prettier
          ];
        };
      });

      # `nix build` compiles theme.css into ./result.
      packages = forAllSystems (pkgs: {
        default = pkgs.stdenvNoCC.mkDerivation {
          pname = "anuppuccin";
          version = (builtins.fromJSON (builtins.readFile ./manifest.json)).version;
          src = ./.;
          nativeBuildInputs = [
            pkgs.dart-sass
            pkgs.gnumake
          ];
          buildPhase = ''
            make build
          '';
          installPhase = ''
            mkdir -p $out
            cp theme.css manifest.json $out/
          '';
        };
      });

      formatter = forAllSystems (pkgs: pkgs.nixfmt);
    };
}
