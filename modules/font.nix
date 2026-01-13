{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    noto-fonts
    font-awesome
    maple-mono.NF-CN
    jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Maple Mono NF CN" "JetBrains Mono" ];
    };
  };
}
