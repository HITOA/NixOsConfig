{ config, pkgs, outputs, ... }:
{
  imports = [ outputs.homemanagerModules.default ];

  home.username = "HITO";
  home.homeDirectory = "/home/HITO";

  applications.kitty.enable = true;

  hyprland.enable = true;
  hyprland.binding.mainMod = "Control_L";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}