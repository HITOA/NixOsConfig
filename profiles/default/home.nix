{ config, pkgs, ... }:
{
  home.username = "HITO";
  home.homeDirectory = "/home/HITO";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}