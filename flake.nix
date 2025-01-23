{
  ######
  inputs = {
    ######
    #nixpkgs-old.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Main nix package repository
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # generating filesystems in different formats
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS unstable channel
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # ready made hardware configurations. e.G.: Power saving
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # for managing flatpaks, like which ones are installed and which not
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  #######
  outputs =
    #######
    {
      self,
      nixpkgs,
      nixos-hardware,
      nixpkgs-unstable,
      nix-flatpak,
      home-manager,
      nixos-generators,
      ...
    } @ inputs: let
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];

      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;

      host_helper = hostname: {
        ${hostname} = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [
            ./hosts/${hostname}/${hostname}.nix
          ];
        };
      };
    in {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays {inherit inputs;};
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      #nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations =
        host_helper "crocoite"; # // (host_helper example);

      ## Standalone home-manager configuration entrypoint
      ## Available through 'home-manager --flake .#your-username@your-hostname'
      #homeConfigurations = {
      #  # FIXME replace with your username@hostname
      #  "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
      #    pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
      #    extraSpecialArgs = {inherit inputs;};
      #    modules = [
      #      # > Our main home-manager configuration file <
      #      ./home-manager/home.nix
      #    ];
      #  };
      #};

      packages.x86_64-linux = {
        factorio = nixos-generators.nixosGenerate {
          system = "x86_64-linux";
          modules = [
            # you can include your own nixos configuration here, i.e.
            ./hosts/factorio/factorio.nix
          ];

          customFormats = {
            "myFormat" = {
              lib,
              modulesPath,
              ...
            }: {
              imports = [
                "${toString modulesPath}/virtualisation/proxmox-lxc.nix"
              ];
              boot.loader.grub.enable = lib.mkForce false;
              boot.loader.systemd-boot.enable = lib.mkForce false;
              formatAttr = "tarball";
              fileExtension = "asd.tar.xz";
            };
          };
          format = "myFormat";
          #format = "vmware";
        };
      };
    };
}
