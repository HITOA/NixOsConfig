{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.blender = {
    enable = lib.mkEnableOption "Enable blender.";
  };

  config = lib.mkIf config.applications.blender.enable {
    home.packages = [
      pkgs.blender
    ];
  };
}