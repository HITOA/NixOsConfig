{ config, pkgs, outputs, ... }:
{
  imports = [ outputs.homemanagerModules.default ];

  home.username = "HITO";
  home.homeDirectory = "/home/HITO";
  
  applications.vesktop.enable = true;
  applications.wofi.enable = true;
  applications.codium.enable = true;
  applications.zellij.enable = true;
  applications.kitty.enable = true;
  applications.vivaldi.enable = true;
  applications.pavucontrol.enable = true;
  applications.nmapplet.enable = true;
  applications.keepassxc.enable = true;
  applications.pcmanfm.enable = true;
  applications.swww.enable = true;
  
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}