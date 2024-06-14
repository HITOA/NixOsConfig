{ pkgs, lib, config, ... }:
{
  options.applications.pavucontrol = {
    enable = lib.mkEnableOption "Enable pavucontrol.";
  };

  config = lib.mkIf config.applications.pavucontrol.enable {
    home.packages = [
      pkgs.pavucontrol
    ];
  };
}