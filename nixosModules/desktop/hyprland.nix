{ pkgs, lib, config, inputs, ... }:
{
  options.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland compositor.";
    
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    }
  };
}