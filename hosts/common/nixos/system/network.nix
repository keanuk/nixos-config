{ config, pkgs, lib, ... }:

{
  # Set your time zone.
  # time.timeZone = lib.mkForce null;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  services = {
    automatic-timezoned.enable = true;
    fail2ban.enable = true;
    localtimed.enable = true;
    netbird.enable = true;
    openssh = {
      enable = true;
      ports = [
      	22
      ];
      settings = {
      	PasswordAuthentication = false;
      };
    };
    printing.enable = true;
    resolved.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    firewall.enable = true;
    # firewall.trustedInterfaces = [ "wt0" ];
    networkmanager.enable = true;
  };
}
