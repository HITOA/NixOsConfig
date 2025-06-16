{ pkgs, lib, config, ... }:
{
  options.module.sound.pipewire = {
    enable = lib.mkEnableOption "Enable pipewire hardware.";
  };

  config = lib.mkIf config.module.sound.pipewire.enable {
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        jack.enable = true;
        pulse.enable = true;

        extraConfig = {
          pipewire.adjust-sample-rate = {
            "context.properties" = {
              "default.clock.rate" = 44100;
            };
          };
          pipewire-pulse."adjust-quirk-rules" = {
            "pulse.rules" = [
              {
                matches = [
                  { "application.process.binary" = "electron"; }
                ];
                actions = {
                  quirks = [
                    "block-source-volume"
                  ];
                };
              }
            ];
          };
        };
    };
  };
}