{ config, pkgs, ... }:

{
  boot = {
    plymouth.enable = false;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://channels.nixos.org/nixos-23.11";
  };
}
