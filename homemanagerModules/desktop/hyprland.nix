{ pkgs, lib, config, inputs, ... }:
{
  options.hyprland = {
    binding = {
      mainMod = lib.mkOption {
        default = "SUPER";
      };
    };
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        #INPUT
        input = {
          kb_layout = config.locale.keyboardLayout;
          kb_variant = config.locale.keyboardVariant;
          follow_mouse = "1";
        };

        bind = [
          "${config.hyprland.binding.mainMod}, Q, exec, kitty"
        ];

      };
    };
  };
}