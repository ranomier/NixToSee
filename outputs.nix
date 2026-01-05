inputs: let
  flake-parts = inputs.flake-parts;
in
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      #"aarch64-linux"
      "x86_64-linux"
    ];

    imports = [
      ./hosts
    ];

  # use the flake-parts flake structure
  flake = {

  # Checks, they use derivations and run duing `nix flake check`,
  # individual checks can be accessed trhough:
  # `nix build -L -v --print-out-paths --no-link .#checks.x86_64-linux.<check-name>`
  # list of checks defined under outputs.checks with:
  # `nix eval --json .#checks`
  #checks = import ./checks inArgs;

  # Formatter for your nix files, available through 'nix fmt'
  # Other options beside 'alejandra' include 'nixpkgs-fmt'
  #formatter = forAllSystems (system: inArgs.nixpkgs.legacyPackages.${system}.alejandra);
 
  # Reusable nixos modules you might want to export
  # These are usually stuff you would upstream into nixpkgs
  #nixosModules = import ./modules/nixos;


  # Your custom packages and modifications, exported as overlays
  overlays = import ./overlays inputs;


  # Your custom packages
  # Accessible through 'nix build', 'nix shell', etc
  #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
  };
}
