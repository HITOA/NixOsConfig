{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.hyprland = {
    binding = {
      mainMod = lib.mkOption {
        default = "SUPER";
      };
    };
  };

  config = lib.mkIf nixosConfig.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        #INPUT
        input = {
          kb_layout = nixosConfig.locale.keyboardLayout;
          kb_variant = nixosConfig.locale.keyboardVariant;
          follow_mouse = "1";
        };

        bind = [
          "${config.hyprland.binding.mainMod}, Q, exec, kitty"
        ];

      };
    };
  };
}