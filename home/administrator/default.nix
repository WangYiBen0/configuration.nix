{ config, pkgs, ... }:

{
  users.users.administrator = {
    isNormalUser = true;
    description = "Administrator";
    shell = pkgs.bash;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
