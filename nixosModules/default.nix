{ ... }:
{
  imports = [
    ./locale/locale.nix
    ./user/main-user.nix
    ./nix/settings.nix
    ./nix/storage.nix
    ./hardware/nvidia.nix
  ];
}