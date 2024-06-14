{ pkgs, lib, config, ... }:
{
  options.applications.keepassxc = {
    enable = lib.mkEnableOption "Enable keepassxc.";
  };

  config = lib.mkIf config.applications.keepassxc.enable {
    home.packages = [
        pkgs.keepassxc
    ];
  };
}