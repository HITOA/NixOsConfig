{ config, lib, pkgs, inputs, outputs, ... }:
{

  imports = [
    outputs.nixosModules.default
    ./hardware-configuration.nix
  ];

  environment.sessionVariables = {
    FLAKE = "/etc/nixos";
  };

  monitors = [
    {
      name = "DP-1";
      width = 1920;
      height = 1080;
      workspace = "1";
      x = 0;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      workspace = "2";
      x = 1920;
      primary = true;
    }
  ];

  environment.systemPackages = [
    pkgs.nh
    pkgs.unar
    pkgs.lutris
    pkgs.wineWowPackages.staging
    pkgs.winetricks
    pkgs.reaper
    pkgs.yabridge
    pkgs.yabridgectl
    pkgs.zulu
    pkgs.docker-compose
    pkgs.dbeaver-bin
    pkgs.tiled
    pkgs.nwjs
    pkgs.whitesur-icon-theme
    pkgs.bash
    pkgs.android-file-transfer
    pkgs.usbutils
    pkgs.jmtpfs
    pkgs.qpwgraph
    pkgs.jetbrains.idea-community-bin
    pkgs.furnace
    pkgs.arduino
    pkgs.anki-bin
  ];

  services.resolved.enable = true;
  
  systemd.services.wgnord =
  let
    # FIXME: Set your preferred country https://github.com/phirecc/wgnord/blob/master/countries.txt
    country = "Japan";
    # FIXME: Set as an absolute path to a file containing your token. It's a
    # secret to be careful with permissions and ownership etc... and do not
    # include the token in your nix config.
    tokenFile = "/home/HITO/vpn/nordvpn-token.txt";
    # This template works as is but you can customise it if you want
    template = pkgs.writeText "template.conf" ''
      [Interface]
      PrivateKey = PRIVKEY
      Address = 10.5.0.2/32
      MTU = 1350
      DNS = 103.86.96.100 103.86.99.100

      [Peer]
      PublicKey = SERVER_PUBKEY
      AllowedIPs = 0.0.0.0/0, ::/0
      Endpoint = SERVER_IP:51820
      PersistentKeepalive = 25
    '';
  in
  {
    unitConfig = {
      Description = "Nord Wireguard VPN";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
      StartLimitBurst = 3;
      StartLimitIntervalSec = 30;
    };

    serviceConfig = {
      Type = "oneshot";
      StateDirectory = "wgnord";
      StateDirectoryMode = "0700";
      ConfigurationDirectory = "wireguard";
      ConfigurationDirectoryMode = "0700";
      ExecStartPre = [
        "${lib.getExe' pkgs.coreutils "ln"} -fs ${template} /var/lib/wgnord/template.conf"
        "${lib.getExe' pkgs.bash "sh"} -c '${lib.getExe pkgs.wgnord} login \"$(<${tokenFile})\"'"
      ];
      ExecStart = "${lib.getExe pkgs.wgnord} connect \"${country}\"";
      ExecStop = "-${lib.getExe pkgs.wgnord} disconnect";
      Restart = "on-failure";
      RestartSec = 10;
      RemainAfterExit = "yes";
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  kernel.hid-tmff2.enable = true;

  display-manager.sddm.enable = true;
  compositor.hyprland.enable = true;

  applications.steam.enable = true;
  applications.git.enable = true;
  
  #programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
  #programs.anime-games-launcher.enable = true;
  #programs.anime-borb-launcher.enable = true;
  #programs.honkers-railway-launcher.enable = true;
  #programs.honkers-launcher.enable = true;
  #programs.wavey-launcher.enable = true;
  #programs.sleepy-launcher.enable = true;
  programs.nix-ld.enable = true;


  xdg-portal.enable = true;
  polkit.enable = true;

  hardware.amdgpu.enable = true;
  module.sound.pipewire.enable = true;
  musnix.enable = true;

  networking.hostName = "HITO";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 37037 ];
  };

  locale.timeZone = "Europe/Paris";
  locale.lang = "fr_FR.UTF-8";
  locale.keyboardLayout = "fr";

  nix.storage.optimize = true;
  nix.gc.enable = true;

  mainUser = {
    enable = true;
    username = "HITO";
    homemanagerConfig = import ./home.nix;
  };

  temmix.enable = true;
  temmix.targets.gtk.enable = true;

  virtualisation.waydroid.enable = true;

  programs.alvr.enable = true;
  programs.alvr.openFirewall = true;
  
  system.stateVersion = "24.05";
}