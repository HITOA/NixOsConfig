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
  };
}