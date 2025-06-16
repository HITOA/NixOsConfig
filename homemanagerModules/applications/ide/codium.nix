{ pkgs, lib, config, inputs, nixosConfig, ... }:
{
  options.applications.codium = {
    enable = lib.mkEnableOption "Enable codium terminal emulator.";
  };

  config = lib.mkIf config.applications.codium.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-vscode.cpptools
        ms-vscode.cmake-tools
      ];
    };
  };
}