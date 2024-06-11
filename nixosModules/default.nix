{ ... }:
{
  imports = [
    ./locale/locale.nix
    ./user/main-user.nix
    ./nix/settings.nix
    ./nix/storage.nix
    ./desktop/hyprland.nix
  ];
}