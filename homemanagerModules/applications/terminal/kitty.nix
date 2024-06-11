{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.kitty = {
    enable = lib.mkEnableOption "Enable kitty terminal emulator.";
  };

  config = lib.mkIf config.applications.kitty.enable {
    programs.kitty = {
      enable = true;
    };

    applications.terminal = {
      enable = true;
      binary = "kitty";
    };
  };
}