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
    zip
    unzip
    rar
    unrar
    p7zip

    # utils
    fastfetch
    btop
    brightnessctl
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
    kdePackages.partitionmanager
    gnome-tweaks
    tealdeer
    lazygit
    stylua
    tree-sitter
    clang-tools
    tree
    lftp
    clock-rs
    trashy
    wiremix

    libreoffice-qt
    inkscape

    # im
    #wechat
    qq

    # develop
    gcc
    clang
    texliveFull

    # nix
    comma
    nh
    home-manager
    nix-index
    nix-inspect
    manix

    # amusement
    graalvmPackages.graalvm-oracle
    hmcl
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

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    steam = {
      enable = true;
      protontricks = {
        enable = true;
      };
      extest = {
        enable = true;
      };
    };

    gamescope = {
      enable = true;
    };

    neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
    };
  };
}
