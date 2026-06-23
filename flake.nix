{
  description = "W1ngD1nGa5ter's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      imports = [
        inputs.git-hooks-nix.flakeModule
      ];

      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          formatter = pkgs.nixfmt-tree;

          pre-commit = {
            settings = {
              hooks = {
                nixfmt.enable = true;
                deadnix.enable = true;
                statix.enable = true;
              };
            };
          };

          devShells.default = pkgs.mkShell {
            inherit (config.pre-commit) shellHook;
          };
        };

      flake = {
        nixosConfigurations = {
          matebook16d = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./configuration.nix
              ./hosts/matebook16d
            ];
          };

          sxyz-9 = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./configuration.nix
              ./hosts/sxyz-9
            ];
          };

          sxyz-89 = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./configuration.nix
              ./hosts/sxyz-89
            ];
          };
        };
      };
    };
}
