{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.vivaldi = {
    enable = lib.mkEnableOption "Enable vivaldi terminal emulator.";
  };

  config = lib.mkIf config.applications.vivaldi.enable {
    environment.systemPackages = [
      pkgs.vivaldi
    ];
  };
}