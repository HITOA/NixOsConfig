{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.krita = {
    enable = lib.mkEnableOption "Enable krita.";
  };

  config = lib.mkIf config.applications.krita.enable {
    home.packages = [
      pkgs.krita
    ];
  };
}