{...}: {
  imports = [
    #./plymouth.nix
    ./accessibility.nix
    ./customisation.nix
    ./environment.nix
    ./locale.nix
    ./networking.nix
    ./firewall.nix
  ];
}
