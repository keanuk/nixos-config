{
  description = "Keanu's NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-23.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";	
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "stable";	
    };

    # Secure Boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # VSCode Server
    vscode-server.url = "github:nix-community/nixos-vscode-server";

    # COSMIC Desktop
    # cosmic-epoch.url = "github:pop-os/cosmic-epoch";
    cosmic-applets.url = "github:pop-os/cosmic-applets";
    cosmic-applibrary.url = "github:pop-os/cosmic-applibrary";
    cosmic-comp.url = "github:pop-os/cosmic-comp";
    cosmic-launcher.url = "github:pop-os/cosmic-launcher";
    cosmic-notifications.url = "github:pop-os/cosmic-notifications";
    cosmic-osd.url = "github:pop-os/cosmic-osd";
    cosmic-panel.url = "github:pop-os/cosmic-panel";
    # cosmic-protocols.url = "github:pop-os/cosmic-protocols";
    cosmic-settings.url = "github:pop-os/cosmic-settings";
    cosmic-settings-daemon.url = "github:pop-os/cosmic-settings-daemon";
    cosmic-session.url = "github:pop-os/cosmic-session";
    # cosmic-text.url = "github:pop-os/cosmic-text";
    # cosmic-text-editor.url = "github:pop-os/cosmic-text-editor";
    # cosmic-theme.url = "github:pop-os/cosmic-theme";
    # cosmic-theme-editor.url = "github:pop-os/cosmic-theme-editor";
    # cosmic-time.url = "github:pop-os/cosmic-time";
    # cosmic-workspaces-epoch.url = "github:pop-os/cosmic-workspaces-epoch";
    # libcosmic.url = "github:pop-os/libcosmic";
    xdg-desktop-portal-cosmic.url = "github:pop-os/xdg-desktop-portal-cosmic";
  };

  outputs = { self, nixpkgs, stable, home-manager, home-manager-stable, lanzaboote, vscode-server, ... }@inputs: {
    nixosConfigurations = {
      enterprise = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          {
            networking.hostName = "enterprise";
            system.stateVersion = "23.05";
          }
          ./desktop/desktop.nix
          ./desktop/gnome.nix
          ./hardware/enterprise.nix
          ./nix/configuration.nix
          ./packages/desktop.nix
          ./packages/packages.nix
          # ./system/amd.nix
          ./system/battery.nix
          ./system/btrfs.nix
          ./system/desktop.nix
          ./system/lanzaboote.nix
          ./system/network.nix
          ./system/system.nix
          ./user/keanu/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.keanu = {
              imports = [ ./user/keanu/home.nix ];
              home.stateVersion = "23.11";
            };
          }
          lanzaboote.nixosModules.lanzaboote
          vscode-server.nixosModules.default
        ];
      };
      hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          {
            networking.hostName = "hermes";
            system.stateVersion = "23.05";
          }
          ./desktop/cosmic.nix
          ./desktop/desktop.nix
          ./desktop/gnome.nix
          ./hardware/hermes.nix
          ./nix/configuration.nix
          ./packages/desktop.nix
          ./packages/packages.nix
          ./system/battery.nix
          ./system/btrfs.nix
          ./system/desktop.nix
          ./system/lanzaboote.nix
          ./system/network.nix
          ./system/system.nix
          ./user/keanu/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.keanu = {
              imports = [ ./user/keanu/home.nix ];
              home.stateVersion = "23.11";
            };
          }
          lanzaboote.nixosModules.lanzaboote
          vscode-server.nixosModules.default
        ];
      };
      terra = stable.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          {
            networking.hostName = "terra";
            system.stateVersion = "23.05";
          }
          ./hardware/terra.nix
          ./nix/configuration.nix
          ./packages/packages.nix
          ./packages/server.nix
          ./system/btrfs.nix
          ./system/network.nix
          ./system/server.nix
          ./system/system.nix
          ./system/systemd-boot.nix
          ./user/keanu/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.keanu = {
              imports = [ ./user/keanu/home.nix ];
              home.stateVersion = "23.05";
            };
          }
        ];
      };
      titan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;
        modules = [
          {
   	        networking.hostName = "titan";
            system.stateVersion = "23.05";
          }
          ./desktop/desktop.nix
          ./desktop/desktop.nix
          ./desktop/gnome.nix
          ./hardware/titan.nix
          ./nix/configuration.nix
          ./packages/desktop.nix
          ./packages/packages.nix
          ./system/amd.nix
          ./system/btrfs.nix
          ./system/desktop.nix
          ./system/lanzaboote.nix
          ./system/network.nix
          ./system/system.nix
          ./user/keanu/users.nix
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.keanu = {
              imports = [ ./user/keanu/home.nix ];
              home.stateVersion = "23.11";
            };
          }
          lanzaboote.nixosModules.lanzaboote
          vscode-server.nixosModules.default
        ];
      };
    };
  };
}
