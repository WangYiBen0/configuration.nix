{ pkgs, ... }:
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
    lftp

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
    nix-inspect

    # amusement
    graalvmPackages.graalvm-oracle

    # GUI
    zen-browser
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs = {
    firefox.enable = true;

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    fish.enable = true;
    zsh = {
      enable = true;
      enableBashCompletion = false;
    };

    steam.enable = true;

    clash-verge = {
      enable = true;
      tunMode = true;
      autoStart = true;
    };

    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
    };
  };
}
