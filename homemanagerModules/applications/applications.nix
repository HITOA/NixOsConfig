{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications = {
    terminal = {
      enable = lib.mkEnableOption "Enable terminal.";
      binary = lib.mkOption {
        default = "";
      };
    };
    launcher = {
      enable = lib.mkEnableOption "Enable launcher.";
      binary = lib.mkOption {
        default = "";
      };
    };
    explorer = {
      enable = lib.mkEnableOption "Enable explorer.";
      binary = lib.mkOption {
        default = "";
      };
    };
    wallpaper = {
      enable = lib.mkEnableOption "Enable wallpaper.";
      binary = lib.mkOption {
        default = "";
      };
    };
    screenshot = {
      enable = lib.mkEnableOption "Enable screenshot";
      binary = lib.mkOption {
        default = "";
      };
    };
  };
}