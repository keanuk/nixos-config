# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/a7a50ee6-ebfa-4901-bdd7-f6d6d2e5bdc0";
  boot.initrd.luks.devices."cryptroot2".device = "/dev/disk/by-uuid/ea72ef0b-520a-436e-b9b4-0f7484325ad1";

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/.snapshots" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@snapshots" ];
    };

  fileSystems."/var/log" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@var_log" ];
    };

  fileSystems."/swap" =
    {
      device = "/dev/disk/by-uuid/ced57910-ad37-40b5-9617-fd912fcbc390";
      fsType = "btrfs";
      options = [ "subvol=@swap" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/2578-2131";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp39s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp41s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
