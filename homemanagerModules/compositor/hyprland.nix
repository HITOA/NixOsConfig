{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland compositor.";
    binding = {
      mainMod = lib.mkOption {
        default = "Super";
      };
    };
  };

  config.wayland.windowManager.hyprland = lib.mkIf config.hyprland.enable {
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
        ",F12,togglespecialworkspace"
      ] ++
        lib.optional config.applications.terminal.enable "${config.hyprland.binding.mainMod}, Q, exec, ${config.applications.terminal.binary}";

      exec-once = [
        "[workspace special; size 100% 100%;move 12.5% 40] ${config.applications.terminal.binary} ${lib.mkIf config.applications.zellij.enable "zellij"}"
      ];

    };
  };
}