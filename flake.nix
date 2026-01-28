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

    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # apple-fonts = {
    #   url = "github:Lyndeno/apple-fonts.nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;

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

        livecd = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # 1. 导入官方 ISO 基础模块
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-calamares.nix"

            # 2. 导入你的通用配置（不包含 hardware-configuration.nix）
            ./configuration.nix

            { nixpkgs.overlays = import ./overlays inputs; }

            # 3. 针对 ISO 的特殊微调
            (
              { config, pkgs, ... }:
              {
                # 排除掉会导致构建 ISO 失败的本地硬件设置
                # 因为 ISO 使用的是自己的内核挂载逻辑
                boot.loader.grub.enable = pkgs.lib.mkForce false;
                boot.loader.systemd-boot.enable = pkgs.lib.mkForce false;
                fileSystems."/" = pkgs.lib.mkForce { device = "/dev/root"; }; # 只是占位

                # 如果你的 configuration.nix 里 import 了 hardware-configuration.nix
                # 你可能需要在 configuration.nix 里做条件判断，或者在这里强制禁用相关项

                # 允许使用 sudo 无密码（方便 Live 环境操作）
                security.sudo.wheelNeedsPassword = false;
              }
            )
          ];
        };
      };

    };
}
