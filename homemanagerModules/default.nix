{ ... }:
{
  imports = [
    ./compositor/hyprland.nix
    ./applications/applications.nix
    ./applications/terminal/kitty.nix
  ];
}