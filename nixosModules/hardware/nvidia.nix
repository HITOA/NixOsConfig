{ pkgs, lib, config, ... }:
{
  options.hardware.nvidia = {
    enable = lib.mkEnableOption "Enable nvidia hardware.";
  };

  config = lib.mkIf config.hardware.nvidia.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      #powerManagement.enable = false;
      #powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = false;
    };
  };
}