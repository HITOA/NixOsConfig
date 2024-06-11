{ config, pkgs, outputs, ... }:
{
  imports = [ outputs.homemanagerModules.default ];

  home.username = "HITO";
  home.homeDirectory = "/home/HITO";

  applications.kitty.enable = true;

  hyprland.enable = true;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}