{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    package = pkgs.ghostty;
    settings = {
      theme = "dark:catppuccin-frappe,light:catppuccin-latte";
    };
  };
}