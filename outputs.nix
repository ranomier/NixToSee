inArgs: let
  # Supported systems for your flake packages, shell, etc.
  systems = [
    #"aarch64-linux"
    "x86_64-linux"
  ];
  # This is a function that generates an attribute by calling a function you
  # pass to it, with each system as an argument
  forAllSystems = inArgs.nixpkgs.lib.genAttrs systems;
in {
  # NixOS configuration entrypoint
  # Available through 'nixos-rebuild --flake .#your-hostname'
  nixosConfigurations = import ./hosts inArgs;

  # Your custom packages
  # Accessible through 'nix build', 'nix shell', etc
  #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

  # Your custom packages and modifications, exported as overlays
  overlays = import ./overlays {inArgs = inArgs;};

  # Reusable nixos modules you might want to export
  # These are usually stuff you would upstream into nixpkgs
  #nixosModules = import ./modules/nixos;

  # Formatter for your nix files, available through 'nix fmt'
  # Other options beside 'alejandra' include 'nixpkgs-fmt'
  formatter = forAllSystems (system: inArgs.nixpkgs.legacyPackages.${system}.alejandra);

  #checks = forAllSystems (system: inArgs(hostHelper "crocoite").system.build.toplevel);
}
