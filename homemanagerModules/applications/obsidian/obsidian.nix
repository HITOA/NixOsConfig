{ pkgs, lib, config, ... }:
{
  options.applications.obsidian = {
    enable = lib.mkEnableOption "Enable obsidian.";
  };

  config = lib.mkIf config.applications.obsidian.enable {
    home.packages = [
        pkgs.obsidian
    ];
  };
}