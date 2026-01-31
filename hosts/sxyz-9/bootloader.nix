{ _pkgs, ... }:

{
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.netbootxyz.enable = true;
    };
  };
}
