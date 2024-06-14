{ pkgs, lib, config, inputs, ... }:
{
  options.xdg-portal = {
    enable = lib.mkEnableOption "Enable XDG Portal.";
  };

  config = lib.mkIf config.xdg-portal.enable {
    xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config.common.default = ["hyprland" "gtk"];
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
    };
  };
}