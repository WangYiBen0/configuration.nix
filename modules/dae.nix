{ inputs, pkgs, ... }:
{
  imports = [
    inputs.daeuniverse.nixosModules.daed
  ];

  services = {
    daed = {
      enable = true;
      package = pkgs.daed;
      openFirewall = {
        enable = true;
        port = 12345;
      };
    };
  };
}
