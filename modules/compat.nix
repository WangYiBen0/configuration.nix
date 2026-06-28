{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    patchelf
    appimage-run
    steam-run

    distrobox

    wine-staging
    winetricks
    bottles

    mono
  ];

  programs.nix-ld = {
    enable = true;
    libraries =
      (pkgs.appimage-run.args.multiPkgs pkgs)
      ++ (with pkgs; [
        stdenv.cc.cc
        icu
        libgdiplus
        gtk2-x11
      ]);
  };

  services.flatpak.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
