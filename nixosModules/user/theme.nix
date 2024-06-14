{ pkgs, lib, config, inputs, ... }:
{
  options.theme = {
    enable = lib.mkEnableOption "Enable theme with stylix.";
    wallpaper = lib.mkOption {
        default = ./default.jpg;
    };
  };

  config = lib.mkIf config.theme.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      image = config.theme.wallpaper;
      polarity = "dark";
      targets.grub.useImage = true;
    };

    #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}