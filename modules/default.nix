{...}: {
  imports = [
    #./plymouth.nix
    ./customisation.nix
    ./environment.nix
    ./locale.nix
    ./networking.nix
  ];
}
