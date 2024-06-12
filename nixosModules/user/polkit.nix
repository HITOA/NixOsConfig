{ pkgs, lib, config, inputs, ... }:
{
  options.polkit = {
    enable = lib.mkEnableOption "Enable codium terminal emulator.";
  };

  config = lib.mkIf config.polkit.enable {
    environment.systemPackages = [
      pkgs.polkit_gnome
    ];

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "Polkit agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      };
    };
  };
}