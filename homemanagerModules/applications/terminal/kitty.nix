{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.kitty = {
    enable = lib.mkEnableOption "Enable kitty terminal emulator.";
  };

  config = lib.mkIf config.applications.kitty.enable {
    programs.kitty = {
      enable = true;
    };

    terminalEmulator.enable = true;
    terminalEmulator.binary = "${programs.kitty.package}/bin/kitty"
  };
}