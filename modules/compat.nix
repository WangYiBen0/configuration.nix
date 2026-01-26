{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    patchelf
    appimage-run
    steam-run

    wine-staging
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [ ];
  };

  services.flatpak.enable = true;
}
