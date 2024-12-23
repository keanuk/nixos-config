{ inputs, outputs, nix-colors, ... }: {
  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-hardware.nixosModules.hp-elitebook-845g8
    inputs.nixos-cosmic.nixosModules.default
    ../common/nixos/base/default.nix
    ../common/nixos/base/lanzaboote.nix
    ../common/nixos/desktop/default.nix
    ../common/nixos/desktop/cosmic.nix
    ../common/nixos/desktop/hyprland.nix
    ../common/nixos/user/keanu/default.nix

    # Change during next reinstall
    ../common/nixos/base/swapfile.nix
    ../common/nixos/base/fs.nix
  ];

  networking.hostName = "hyperion";

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs nix-colors; };
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.keanu = {
      imports = [ ../../home/hyperion.nix ];
      home.stateVersion = "23.11";
    };
  };

  system.stateVersion = "23.05";
}
