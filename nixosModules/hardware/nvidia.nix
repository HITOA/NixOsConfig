{ pkgs, lib, config, ... }:
{
  options.hardware.nvidia = {
    enable = lib.mkEnableOption "Enable nvidia hardware.";
  };

  config = lib.mkIf config.hardware.nvidia.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.modesetting.enable = true;
  };
}