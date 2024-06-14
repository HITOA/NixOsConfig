{ pkgs, lib, config, ... }:
{
  options.applications.thunar = {
    enable = lib.mkEnableOption "Enable thunar.";
  };

  config = lib.mkIf config.applications.thunar.enable {
    home.packages = [
        pkgs.xfce.thunar
    ];

    applications.explorer = {
        enable = true;
        binary = "${pkgs.xfce.thunar}/bin/thunar";
    };
  };
}