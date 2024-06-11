{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland compositor.";
    binding = {
      mainMod = lib.mkOption {
        default = "SUPER";
      };
    };
  };

  config.wayland.windowManager.hyprland = lib.mkIf config.hyprland.enable {
    terminalEmulator.enable = lib.mkDefault false;

    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    
    settings = {
      #INPUT
      input = {
        kb_layout = nixosConfig.locale.keyboardLayout;
        kb_variant = nixosConfig.locale.keyboardVariant;
        follow_mouse = "1";
      };

      #BINDING
      bind = [
        lib.mkIf config.terminalEmulator.enable "${config.hyprland.binding.mainMod}, Q, exec, ${config.terminalEmulator.binary}"
      ];

    };
  };
}