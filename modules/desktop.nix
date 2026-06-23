{ pkgs, ... }:
{
  services = {
    displayManager.plasma-login-manager.enable = true;
    desktopManager.plasma6.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  programs = {
    hyprland.enable = true;
    niri.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      noctalia-shell
      fuzzel
      swaylock
      xwayland-satellite
      kdePackages.plasma-browser-integration
    ];

    variables = {
      # QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
      INPUT_METHOD = "fcitx";
    };
  };
}
