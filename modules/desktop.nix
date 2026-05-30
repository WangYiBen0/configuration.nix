{ pkgs, ... }:
{
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    noctalia-shell
    fuzzel
    swaylock
    xwayland-satellite
    kdePackages.plasma-browser-integration
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  programs.hyprland = {
    enable = true;
  };

  programs.niri = {
    enable = true;
  };

  environment.variables = {
    # QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD = "fcitx";
  };
}
