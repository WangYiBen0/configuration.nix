{ config, pkgs, ... }:

{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    noctalia-shell
    fuzzel
    swaylock
    xwayland-satellite
    kdePackages.plasma-browser-integration
  ];

  programs.hyprland = {
    enable = true;
  };

  programs.niri = {
    enable = true;
  };

  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
        qt6Packages.fcitx5-chinese-addons
        fcitx5-rime
        qt6Packages.fcitx5-configtool
        fcitx5-pinyin-zhwiki
        fcitx5-pinyin-moegirl
      ];
      waylandFrontend = true;
    };
  };
  environment.variables = {
    # QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD = "fcitx";
  };
}
