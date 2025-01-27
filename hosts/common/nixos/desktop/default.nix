{ pkgs, ... }:

{
  imports = [
    ./packages.nix

    ../../dev/flutter.nix
    ../../dev/java.nix
    ../../dev/nim.nix
    ../../dev/node.nix
    ../../dev/virtualization.nix

    ../services/geoclue2.nix
    ../services/protonmail.nix
    ../services/udev.nix

    ../programs/evolution.nix
    ../programs/steam.nix

    ../../desktop/fonts.nix
  ];

  security.rtkit.enable = true;
  services = {
    dbus.enable = true;
    flatpak.enable = true;
    fprintd.enable = true;
    gnome.gnome-keyring.enable = true;
    libinput.enable = true;
    passSecretService.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    pulseaudio.enable = false;
    xserver.enable = true;
  };

  fonts.fontDir.enable = true;

  programs = {
    gnupg.agent.enable = true;
    seahorse.enable = true;
  };

  hardware = {
    sensor.iio.enable = true;
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      xorg.xbacklight
    ];
  };
}
