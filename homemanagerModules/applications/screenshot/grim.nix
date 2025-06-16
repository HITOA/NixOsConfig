{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.grim = {
    enable = lib.mkEnableOption "Enable grim.";
  };

  config = lib.mkIf config.applications.grim.enable {
    home.packages = [
        pkgs.grimblast
    ];

    applications.screenshot = {
        enable = true;
        binary = "grimblast --freeze copy area";
    };
  };
}