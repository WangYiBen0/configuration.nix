_: {
  imports = [
    ./bootloader.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = import ./hostname.nix;
  system.stateVersion = import ./state-version.nix;
}
