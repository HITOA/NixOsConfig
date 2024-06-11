{ config, lib, pkgs, inputs, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
  };

  environment.systemPackages = [
    pkgs.git
    pkgs.nh
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking.hostName = "HITO";
  networking.networkmanager.enable = true;

  locale.timeZone = "Europe/Paris";
  locale.lang = "fr_FR.UTF-8";
  locale.keyboardLayout = "fr";

  nix.storage.optimize = true;
  nix.gc.enable = true;

  mainUser = {
    enable = true;
    username = "HITO";
    homemanagerConfig = import ./home.nix;
  };

  hyprland.enable = true;
  
  system.stateVersion = "24.05";
}