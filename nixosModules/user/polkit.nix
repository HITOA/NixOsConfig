{ pkgs, lib, config, inputs, ... }:
{
  options.polkit = {
    enable = lib.mkEnableOption "Enable codium terminal emulator.";
  };

  config = lib.mkIf config.polkit.enable {
    environment.systemPackages = [
      pkgs.polkit_gnome
    ];

    systemd.services.polkit = {
      enable = true;
      serviceConfig = {
        Type = "simple";
        ExecStart = "echo hello world";
      };
    };
  };
}