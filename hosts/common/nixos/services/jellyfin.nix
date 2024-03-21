{ ... }:

{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "jellyfin";
    group = "media";
  };

  users.users.jellyfin.extraGroups = [
    "data"
  ];
}
