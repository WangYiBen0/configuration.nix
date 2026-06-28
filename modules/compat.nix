{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    patchelf
    appimage-run
    steam-run

    distrobox

    wine-staging
    winetricks
    mono
  ];

  programs.nix-ld = {
    enable = true;
    libraries =
      (pkgs.appimage-run.args.multiPkgs pkgs)
      ++ (with pkgs; [
        stdenv.cc.cc
        icu
      ]);
  };

  services.flatpak.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
