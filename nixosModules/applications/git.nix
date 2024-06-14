{ pkgs, lib, config, inputs, ... }:
{
  options.applications.git = {
    enable = lib.mkEnableOption "Enable git.";
  };

  config = lib.mkIf config.applications.git.enable {
    programs.ssh.startAgent = true;
    
    programs.git = {
        enable = true;
        config = {
            url = {
                "ssh://git@github.com/" = {
                    insteadOf = [
                        "gh:"
                        "github:"
                        "https://github.com/"
                    ];
                };
            };
        };
    };
  };
}