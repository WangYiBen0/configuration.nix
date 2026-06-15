_: {
  imports = [
    ./bootloader.nix
    ./disko.nix
    ./hardware.nix
  ];

  networking.hostName = import ./hostname.nix;
  system.stateVersion = import ./state-version.nix;
}
