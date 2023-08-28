
{
	nixpkgs.config.allowUnfree = true;
    programs.fish = {
   	  enable = true;
    };
    programs.git = {
      enable = true;
      userName = "Keanu Kerr";
      userEmail = "keanu@kerr.us";
    };
    programs.micro = {
      enable = true;
      settings.colorscheme = "simple";
    };
    programs.neovim = {
      enable = true;
      defaultEditor = false;	
    };
    programs.starship = {
      enable = true;
      enableTransience = true;
      settings = import ./starship.nix;
    };
    programs.zsh = {
  	  enable = true;
  	  autocd = true;
  	  enableCompletion = true;
  	  enableAutosuggestions = true;
	    syntaxHighlighting.enable = true;
	    shellAliases = {
	      cleanup = "nix-store --gc && nix-store --optimize";
          ll = "ls -l";
          rebuild = "sudo nixos-rebuild switch --upgrade";
          update = "nix flake update ~/.config/nixos-config";
      };
      oh-my-zsh = {
      	enable = true;
      	theme = "fletcherm";
      	plugins = [
		      "gh"
      	  "git"
      	  "golang"
      	  "rust"
      	  "sudo"
      	  "systemd"
      	];
      };
    };
    home.sessionVariables = {
      EDITOR = "micro";
      SYSTEMD_EDITOR = "micro";
      VISUAL = "micro";
    };
    home.stateVersion = "23.11";
}
