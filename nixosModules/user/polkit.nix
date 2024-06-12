{ pkgs, lib, config, inputs, ... }:
{
  options.polkit = {
    enable = lib.mkEnableOption "Enable codium terminal emulator.";
  };

  config = lib.mkIf config.polkit.enable {
    environment.systemPackages = [
      pkgs.lxde.lxsession
    ];

    systemd.user.services.polkit-agent = {
      description = "Polkit agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.lxde.lxsession}/bin/lxpolkit";
      };
    };
  };
}