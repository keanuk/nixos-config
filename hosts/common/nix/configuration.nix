{ config, pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      allowed-users = [ "@users" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}

