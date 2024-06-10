{ pkgs, lib, config, ... }:
{
  options = {
    locale.timeZone = lib.mkOption {
      default = "CET";
      description = ''
        System time zone.
      '';
    };

    locale.lang = lib.mkOption {
      default = "en_US.UTF-8";
      description = ''
        System lang option.
      '';
    };

    locale.keyboardLayout = lib.mkOption {
      default = "en";
      description = ''
        System keyboard layout.
      '';
    };
  };

  config = {
    time.timeZone = "Europe/Paris";

    i18n.defaultLocale = config.locale.lang;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = config.locale.lang;
      LC_IDENTIFICATION = config.locale.lang;
      LC_MEASUREMENT = config.locale.lang;
      LC_MONETARY = config.locale.lang;
      LC_NAME = config.locale.lang;
      LC_NUMERIC = config.locale.lang;
      LC_PAPER = config.locale.lang;
      LC_TELEPHONE = config.locale.lang;
      LC_TIME = config.locale.lang;
    };

    services.xserver.xkb.layout = config.locale.keyboardLayout;
    console.keyMap = config.locale.keyboardLayout;
  };
}