{ pkgs, lib, config, nixosConfig, ... }:
{
  options.applications.hyprpaper = {
    enable = lib.mkEnableOption "Enable hyprpaper.";
  };

  config = lib.mkIf config.applications.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload =
          [ "${nixosConfig.theme.wallpaper}" ];

        wallpaper = [
          ",${nixosConfig.theme.wallpaper}"
        ];
      };
    };

    applications.wallpaper = {
      enable = true;
      binary = "hyprpaper";
    };
  };
}