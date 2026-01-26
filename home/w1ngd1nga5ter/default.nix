{ config, pkgs, ... }:

{
  users.users.w1ngd1nga5ter = {
    isNormalUser = true;
    description = "W1ngD1nGa5ter";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      whitesur-kde
      whitesur-icon-theme
      whitesur-cursors
      whitesur-gtk-theme
      catppuccin-fcitx5
    ];
  };
}
