{ pkgs, lib, config, ... }:
{
  options.applications.pcmanfm = {
    enable = lib.mkEnableOption "Enable pcmanfm.";
  };

  config = lib.mkIf config.applications.pcmanfm.enable {
    home.packages = [
        pkgs.pcmanfm
    ];

    applications.explorer = {
        enable = true;
        binary = "${lib.getExe pkgs.pcmanfm}";
    };
  };
}