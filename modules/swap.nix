{ config, pkgs, ... }:

{
  swapDevices = [{ 
    device = "/swap/swapfile"; 
    size = 16*1024; # Creates an 16GB swap file 
  }];
  boot.kernelParams = [
    "zswap.enabled=1" # enables zswap
    "zswap.compressor=lz4" # compression algorithm
    "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
    "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
  ];
}
