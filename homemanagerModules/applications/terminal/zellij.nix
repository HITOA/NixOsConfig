{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.zellij = {
    enable = lib.mkEnableOption "Enable zellij terminal emulator.";
    binary = lib.mkOption {
      default = "";
    };
  };

  config = lib.mkIf config.applications.zellij.enable {
    programs.zellij = {
      enable = true;
    };

    applications.zellij.binary = "${pkgs.zellij}/bin/zellij";
  };
}