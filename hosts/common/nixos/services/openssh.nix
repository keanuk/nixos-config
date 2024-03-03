{ config, ... }:

{
  services.openssh = {
    enable = true;
    ports = [
      22
    ];
    settings = {
      PasswordAuthentication = false;
    };
  };
}
