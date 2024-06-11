{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications = {
    terminal = {
      enable = lib.mkEnableOption "Enable terminal.";
      binary = lib.mkOption {
        default = "";
      };
    };
  };
}