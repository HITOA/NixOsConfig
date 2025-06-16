{ ... }:
{
  imports = [
    ./applications/2D/krita.nix
    ./applications/3D/blender.nix
    ./compositor/hyprland.nix
    ./applications/applications.nix
    ./applications/terminal/kitty.nix
    ./applications/terminal/zellij.nix
    ./applications/ide/codium.nix
    ./applications/launcher/wofi.nix
    ./applications/browser/vivaldi.nix
    ./applications/sound/pavucontrol.nix
    ./applications/vesktop/vesktop.nix
    ./applications/networking/nmapplet.nix
    ./applications/passmanager/keepassxc.nix
    ./applications/explorer/nemo.nix
    ./applications/explorer/thunar.nix
    ./applications/explorer/pcmanfm.nix
    ./applications/wallpaper/hyprpaper.nix
    ./applications/wallpaper/swww.nix
    ./applications/screenshot/grim.nix
    ./applications/obsidian/obsidian.nix
  ];
}