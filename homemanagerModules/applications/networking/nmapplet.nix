{ pkgs, lib, config, ... }:
{
  options.applications.nmapplet = {
    enable = lib.mkEnableOption "Enable network manager applet.";
  };

  config = lib.mkIf config.applications.nmapplet.enable {
    home.packages = [
        pkgs.networkmanagerapplet
    ];
  };
}