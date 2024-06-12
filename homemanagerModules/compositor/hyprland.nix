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
        ", F12, togglespecialworkspace"
        "ALT, F4, killactive"
        "ALT SHIFT, F4, exit"
        "${config.hyprland.binding.mainMod}, V, togglefloating"

        "${config.hyprland.binding.mainMod}, code:10, workspace, 1"
        "${config.hyprland.binding.mainMod}, code:11, workspace, 2"
        "${config.hyprland.binding.mainMod}, code:12, workspace, 3"
        "${config.hyprland.binding.mainMod}, code:13, workspace, 4"
        "${config.hyprland.binding.mainMod}, code:14, workspace, 5"
        "${config.hyprland.binding.mainMod}, code:15, workspace, 6"
        "${config.hyprland.binding.mainMod}, code:16, workspace, 7"
        "${config.hyprland.binding.mainMod}, code:17, workspace, 8"
        "${config.hyprland.binding.mainMod}, code:18, workspace, 9"
        "${config.hyprland.binding.mainMod}, code:19, workspace, 10"

        "${config.hyprland.binding.mainMod} SHIFT, code:10, workspace, 1"
        "${config.hyprland.binding.mainMod} SHIFT, code:11, workspace, 2"
        "${config.hyprland.binding.mainMod} SHIFT, code:12, workspace, 3"
        "${config.hyprland.binding.mainMod} SHIFT, code:13, workspace, 4"
        "${config.hyprland.binding.mainMod} SHIFT, code:14, workspace, 5"
        "${config.hyprland.binding.mainMod} SHIFT, code:15, workspace, 6"
        "${config.hyprland.binding.mainMod} SHIFT, code:16, workspace, 7"
        "${config.hyprland.binding.mainMod} SHIFT, code:17, workspace, 8"
        "${config.hyprland.binding.mainMod} SHIFT, code:18, workspace, 9"
        "${config.hyprland.binding.mainMod} SHIFT, code:19, workspace, 10"
        
      ] ++
        lib.optional config.applications.terminal.enable "${config.hyprland.binding.mainMod}, Q, exec, ${config.applications.terminal.binary}" ++
        lib.optional config.applications.launcher.enable "${config.hyprland.binding.mainMod}, SPACE, exec, ${config.applications.launcher.binary}";

      exec-once = [
        "[workspace special; size 100% 100%;move 12.5% 40] ${config.applications.terminal.binary} ${config.applications.zellij.binary}"
      ];

    };
  };
}