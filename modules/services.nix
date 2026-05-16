{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    openssh.enable = true;

    blueman.enable = true;

    kmscon.enable = true;

    btrfs.autoScrub = {
      enable = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 ]; # for Minecraft servers
      allowedUDPPorts = [ 25565 ]; # for Minecraft servers

      # for clash-verge-rev TUN mode
      trustedInterfaces = [ "Mihomo" ];
      extraReversePathFilterRules = ''
        iifname "Mihomo" accept
      '';
    };
  };

  programs = {
    clash-verge = {
      enable = true;
      serviceMode = true;
      autoStart = true;
    };
  };

  systemd.services."kmsconvt@tty1".enable = false;
}
