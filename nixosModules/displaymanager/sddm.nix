{ pkgs, lib, config, inputs, ... }:
{
  options.display-manager.sddm = {
    enable = lib.mkEnableOption "Enable sddm.";
    wayland.enable = lib.mkOption {
      default = true;
    };
  };

  config = lib.mkIf config.display-manager.sddm.enable {
    services.xserver = {
        enable = !config.display-manager.sddm.wayland.enable;
        displayManager = {
            sddm = {
                enable = true;
                wayland.enable = config.display-manager.sddm.wayland.enable;
                theme = "${import ./sddm-theme.nix {inherit pkgs config;}}";
            };
        };
    };

    environment.systemPackages = [
      pkgs.libsForQt5.qt5.qtquickcontrols2
      pkgs.libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}