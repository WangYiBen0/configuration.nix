{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nur = {
    #   url = "github:nix-community/NUR";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nixos-cn = {
    #   url = "github:nixos-cn/flakes";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # apple-fonts = {
    #   url = "github:Lyndeno/apple-fonts.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (system: {
      formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;
    })
    // {

      nixosConfigurations = {
        nixos-matebook16d = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/huawei-matebook16d
            { nixpkgs.overlays = import ./overlays inputs; }
          ];
        };

        nixos-sxyz-9 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./configuration.nix
            ./hosts/sxyz-9
            { nixpkgs.overlays = import ./overlays inputs; }
          ];
        };
      };

    };
}
