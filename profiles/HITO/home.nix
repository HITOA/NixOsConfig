{ config, pkgs, outputs, inputs, ... }:
{
  imports = [ outputs.homemanagerModules.default ];

  home.packages = [
      pkgs.protontricks
      pkgs.godot_4
      pkgs.prismlauncher
      pkgs.osu-lazer-bin
      inputs.temmix
  ];
  
  home.username = "HITO";
  home.homeDirectory = "/home/HITO";
  
  applications.vesktop.enable = true;
  applications.wofi.enable = true;
  applications.codium.enable = true;
  applications.zellij.enable = true;
  applications.kitty.enable = true;
  applications.vivaldi.enable = true;
  applications.pavucontrol.enable = true;
  applications.nmapplet.enable = true;
  applications.keepassxc.enable = true;
  applications.nemo.enable = true;
  applications.swww.enable = true;
  applications.grim.enable = true;
  applications.obsidian.enable = true;
  applications.krita.enable = true;
  applications.blender.enable = true;
  
  home.stateVersion = "24.05";

  services.trayer.enable = true;

  temmix.opacity.terminal = 0.85;
  temmix.targets.vesktop.enable = true;
  temmix.commands = [''
    swww img --transition-type outer --transition-pos 0.854,0.977 --transition-angle 30 --transition-step 60 --transition-duration 1.0 $1
  ''];

  home = {
    pointerCursor = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
      gtk.enable = true;
      x11.enable = true;
    };

    # Only work for X11 ?
    sessionVariables = {
      XCURSOR_THEME = "Nordzy-cursors-white";
      XCURSOR_SIZE = "22";
    };
  };

  # Variables for Wayland ?
  systemd.user.sessionVariables = {
    XCURSOR_THEME = "Nordzy-cursors-white";
    XCURSOR_SIZE = "22";
  };

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Nordzy-cursors-white";
      package = pkgs.nordzy-cursor-theme;
      size = 22;
    };
  };

  programs.obs-studio.enable = true;

  programs.bash.enable = true;
  
  programs.home-manager.enable = true;
}