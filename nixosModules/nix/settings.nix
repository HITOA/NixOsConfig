{ pkgs, lib, config, inputs, ... }:
{
  config = {
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };
}