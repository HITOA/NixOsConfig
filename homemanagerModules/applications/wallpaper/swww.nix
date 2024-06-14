{ pkgs, lib, config, nixosConfig, ... }:
{
  options.applications.swww = {
    enable = lib.mkEnableOption "Enable swww.";
  };

  config = lib.mkIf config.applications.swww.enable {
    home.packages = [
        pkgs.swww
    ];

    applications.wallpaper = {
      enable = true;
      binary = "swww-daemon & swww img ${nixosConfig.theme.wallpaper}";
    };
  };
}