{ pkgs, lib, config, ... }:
{
  options.applications.nemo = {
    enable = lib.mkEnableOption "Enable nemo.";
  };

  config = lib.mkIf config.applications.nemo.enable {
    home.packages = [
        pkgs.nemo
    ];

    applications.explorer = {
        enable = true;
        binary = "${lib.getExe pkgs.nemo}";
    };
  };
}