{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    patchelf
    appimage-run
    steam-run

    distrobox

    wine-staging
  ];

  programs.nix-ld = {
    enable = true;
    libraries =
      (pkgs.steam-run.args.multiPkgs pkgs)
      ++ (with pkgs; [
        icu
        openssl
        zlib
      ]);
  };

  services.flatpak.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
