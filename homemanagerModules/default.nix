{ ... }:
{
  imports = [
    ./compositor/hyprland.nix
    ./applications/applications.nix
    ./applications/terminal/kitty.nix
    ./applications/terminal/zellij.nix
    ./applications/ide/codium.nix
    ./applications/launcher/wofi.nix
    ./applications/browser/vivaldi.nix
  ];
}