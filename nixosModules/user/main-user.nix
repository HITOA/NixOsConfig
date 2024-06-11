{ pkgs, lib, config, inputs, outputs, ... }:
{
  options.mainUser = {
    enable = lib.mkEnableOption "enable main user.";
    username = lib.mkOption {
      default = "default";
    };
    homemanagerConfig = lib.mkOption {
      default = "";
    };
  };

  config = lib.mkIf config.mainUser.enable {
    users.users.${config.mainUser.username} = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs outputs; nixosConfig = config; };
      users.${config.mainUser.username} = config.mainUser.homemanagerConfig;
    };
  };
}