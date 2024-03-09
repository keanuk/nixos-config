{ pkgs, inputs, outputs, ... }: {
	imports = [
    ./disks.nix
		./hardware-configuration.nix

    inputs.home-manager-stable.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    ../common/nixos/base/default.nix
    ../common/nixos/base/nix-stable.nix
    ../common/nixos/base/systemd-boot.nix
    ../common/nixos/user/keanu/default.nix
	];

  networking.hostName = "earth";

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    users.keanu = {
      imports = [ 
        ../common/home-manager/default.nix
      ];
      home.stateVersion = "23.11";
    };
  };

  system.stateVersion = "23.11";
}
