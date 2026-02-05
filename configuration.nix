{ inputs, ... }:
{
  imports = [
    ./modules
    ./home
    { nixpkgs.overlays = import ./overlays inputs; }
  ];
}
