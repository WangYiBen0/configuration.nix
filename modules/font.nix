{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    maple-mono.NF-CN
    jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.liberation
    liberation_ttf
    inter
    winePackages.fonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans CJK SC" "Symbols Nerd Font" ];
      serif = [ "Noto Serif CJK SC" "Symbols Nerd Font" ];
      monospace = [ "Maple Mono NF CN" "JetBrains Mono" "Symbols Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };

    localConf = ''
      <match target="pattern">
        <test name="family"><string>sans-serif</string></test>
        <edit name="family" mode="append"><string>Symbols Nerd Font</string></edit>
      </match>
      <match target="pattern">
        <test name="family"><string>serif</string></test>
        <edit name="family" mode="append"><string>Symbols Nerd Font</string></edit>
      </match>
    '';
  };
}
