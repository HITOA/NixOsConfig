{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.wofi = {
    enable = lib.mkEnableOption "Enable codium terminal emulator.";
  };

  config = lib.mkIf config.applications.wofi.enable {
    programs.wofi = {
      enable = true;
    };
  };
}