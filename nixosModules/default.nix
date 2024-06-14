{ ... }:
{
  imports = [
    ./locale/locale.nix
    ./user/main-user.nix
    ./user/polkit.nix
    ./user/portal.nix
    ./user/theme.nix
    ./nix/settings.nix
    ./nix/storage.nix
    ./hardware/nvidia.nix
    ./hardware/monitor.nix
    ./sound/pipewire.nix
    ./font/font.nix
    ./compositor/hyprland.nix
    ./displaymanager/sddm.nix
    ./applications/steam.nix
    ./applications/git.nix
  ];
}