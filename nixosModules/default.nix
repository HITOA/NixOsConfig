{ ... }:
{
  imports = [
    ./locale/locale.nix
    ./user/main-user.nix
    ./user/polkit.nix
    ./nix/settings.nix
    ./nix/storage.nix
    ./hardware/nvidia.nix
  ];
}