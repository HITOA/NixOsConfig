{ pkgs, lib, config, inputs, ... }:
{
  options.nix = {
    storage.optimize = lib.mkOption {
      default = true;
    };
    
    gc = {
      enable = lib.mkEnableOption "Enable automatic garbage collection.";
      interval = lib.mkOption {
        default = "weekly";
      };
      olderThan = lib.mkOption {
        default = "7d";
      };
    };
  };

  config = {
    nix.settings.auto-optimise-store = config.nix.storage.optimize;
    nix.gc = lib.mkIf config.nix.storage.gc.enable {
      automatic = true;
      dates = config.nix.storage.gc.interval;
      options = "--delete-older-than ${config.nix.storage.gc.olderThan}";
    };
  };
}