{ pkgs, lib, config, ... }:
{
  options.applications.vesktop = {
    enable = lib.mkEnableOption "Enable vesktop.";
  };

  config = lib.mkIf config.applications.vesktop.enable {
    home.packages = [
        pkgs.vesktop
    ];
  };
}