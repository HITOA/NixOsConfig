{ config, lib, pkgs, inputs, outputs, ... }:
{

  imports = [
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
  };

  monitors = [
    {
      name = "DP-3";
      width = 1920;
      height = 1080;
      workspace = "2";
      x = 0;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      workspace = "1";
      x = 1920;
      primary = true;
    }
  ];

  environment.systemPackages = [
    pkgs.nh
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  
  theme = {
    enable = true;
  };

  display-manager.sddm.enable = true;
  compositor.hyprland.enable = true;

  applications.steam.enable = true;
  applications.git.enable = true;

  xdg-portal.enable = true;
  polkit.enable = true;

  hardware.nvidia.enable = true;
  sound.pipewire.enable = true;

  networking.hostName = "HITO";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

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
  
  system.stateVersion = "24.05";
}