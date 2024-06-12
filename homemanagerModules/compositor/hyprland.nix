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

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
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
        ] ++
          lib.optional config.applications.terminal.enable "${config.hyprland.binding.mainMod}, Q, exec, ${config.applications.terminal.binary}" ++
          lib.optional config.applications.launcher.enable "${config.hyprland.binding.mainMod}, SPACE, exec, ${config.applications.launcher.binary}" ++
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10);

        exec-once = [
          "[workspace special; size 100% 100%;move 12.5% 40] ${config.applications.terminal.binary} ${config.applications.zellij.binary}"
        ];

      };
    };

    home.sessionVariables = {
      #Fix cursor issue
      WLR_NO_HARDWARE_CURSORS = "1";
      #Hint Electron to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };
}