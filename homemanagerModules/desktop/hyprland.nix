{ pkgs, lib, config, inputs, ... }:
{
  options.hyprland = {
    binding = {
      mainMod = lib.mkOption {
        default = "SUPER";
      };
    };
  };

  config = lib.mkIf hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        #INPUT
        input = {
          kb_layout = locale.keyboardLayout;
          kb_variant = locale.keyboardVariant;
          follow_mouse = "1";
        };

        bind = [
          "${config.hyprland.binding.mainMod}, Q, exec, kitty"
        ];

      };
    };
  };
}