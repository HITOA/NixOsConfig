{ pkgs, lib, config, ... }:
{
  options.hardware.amdgpu = {
    enable = lib.mkEnableOption "Enable amdgpu hardware.";
  };

  config = lib.mkIf config.hardware.amdgpu.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };

    systemd.tmpfiles.rules = 
    let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in [
      "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];

    environment.systemPackages = [
      pkgs.rocmPackages.rocminfo
    ];

    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}