{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.zellij = {
    enable = lib.mkEnableOption "Enable zellij terminal emulator.";
  };

  config = lib.mkIf config.applications.zellij.enable {
    programs.zellij = {
      enable = true;
    };
  };
}