{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    go
    delve
    gopls
  ];
}
