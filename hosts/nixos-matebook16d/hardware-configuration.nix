{
  config,
  lib,
  _pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "nvme"
      "usbhid"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    kernelParams = [
      "zswap.enabled=1" # enables zswap
      "zswap.compressor=lz4" # compression algorithm
      "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
      "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
    ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/76ff1ed4-5cca-473e-8707-7ec3ef6c3c4a";
      fsType = "btrfs";
      options = [
        "subvol=nixos/@"
        "compress=zstd"
      ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/76ff1ed4-5cca-473e-8707-7ec3ef6c3c4a";
      fsType = "btrfs";
      options = [
        "subvol=nixos/@home"
        "compress=zstd"
      ];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/76ff1ed4-5cca-473e-8707-7ec3ef6c3c4a";
      fsType = "btrfs";
      options = [
        "subvol=nixos/@nix"
        "compress=zstd"
      ];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/76ff1ed4-5cca-473e-8707-7ec3ef6c3c4a";
      fsType = "btrfs";
      options = [
        "subvol=nixos/@boot"
        "compress=none"
        "nodatacow"
      ];
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/F33D-19C4";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    "/swap" = {
      device = "/dev/disk/by-uuid/76ff1ed4-5cca-473e-8707-7ec3ef6c3c4a";
      fsType = "btrfs";
      options = [
        "subvol=nixos/@swap"
        "noatime"
      ];
    };
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 16 * 1024; # Creates an 16GB swap file
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
