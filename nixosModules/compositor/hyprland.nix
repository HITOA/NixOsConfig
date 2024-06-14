{ pkgs, lib, config, inputs, ... }:
{
  options.compositor.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland.";
  };

  config = lib.mkIf config.compositor.hyprland.enable {
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    };
  };
}