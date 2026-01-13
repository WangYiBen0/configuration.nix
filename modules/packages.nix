{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # basic
    git
    curl
    wget
    neovim
    zsh
    fish
    kitty
    zimfw
    starship
    file

    # utils
    fastfetch
    btop
    yazi
    ripgrep
    zellij
    fzf
    fd
    eza
    wl-clipboard
    xclip
    wayland-utils
    xdg-utils
    clash-verge-rev
    kdePackages.partitionmanager
    gnome-tweaks
    tealdeer
    lazygit
    stylua
    tree-sitter
    clang-tools
    tree

    # im
    wechat
    qq

    # develop
    vscode
    gcc
    clang
    texliveFull

    # nix
    nh
    home-manager
    nix-index

    # amusement
    # steamcmd
    # steam-tui

    # GUI
    zen-browser
    # inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.firefox.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.fish.enable = true;
  programs.zsh = {
    enable = true;
    # enableCompletion = false; 
  };

  programs.steam.enable = true;

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    autoStart = true;
  };
}
