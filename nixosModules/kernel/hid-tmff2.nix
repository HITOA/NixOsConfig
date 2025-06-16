{ pkgs, lib, config, ... }:
{
  options.kernel.hid-tmff2 = {
    enable = lib.mkEnableOption "Enable linux kernel module for T300RS, T248.";
  };

  config = lib.mkIf config.kernel.hid-tmff2.enable {
    environment.systemPackages = [
      config.boot.kernelPackages.hid-tmff2
    ];

    boot.extraModulePackages = [
      config.boot.kernelPackages.hid-tmff2
    ];
  };
}