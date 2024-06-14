{ pkgs, lib, config, ... }:
{
  options.sound.pipewire = {
    enable = lib.mkEnableOption "Enable pipewire hardware.";
  };

  config = lib.mkIf config.sound.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;

        extraConfig = {
          pipewire.adjust-sample-rate = {
            "context.properties" = {
              "default.clock.rate" = 44100;
            };
          };
        };
    };
  };
}