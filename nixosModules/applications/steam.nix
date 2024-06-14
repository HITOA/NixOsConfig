{ pkgs, lib, config, inputs, ... }:
{
  options.applications.steam = {
    enable = lib.mkEnableOption "Enable steam.";
  };

  config = lib.mkIf config.applications.steam.enable {
    programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
    };

    environment.systemPackages = [ pkgs.mangohud ];

    programs.gamemode.enable = true;
  };
}