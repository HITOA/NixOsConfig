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
      extraGroups = [ "networkmanager" "wheel" "docker" ];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs outputs; };
      users.${config.mainUser.username} = config.mainUser.homemanagerConfig;
      useGlobalPkgs = true;
      backupFileExtension = "backup";
    };
  };
}