{ pkgs, ... }:
{
  nix = {
    package = pkgs.lix;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://mirrors.cernet.edu.cn/nix-channels/store"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];

      # Optimise storage
      # you can also optimise the store manually via:
      #    nix-store --optimise
      # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
      auto-optimise-store = true;
    };
    # do garbage collection weekly to keep disk usage low

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  # do not need to keep too much generations
  boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;
}
