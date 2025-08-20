{
  imports = [
    ./accessibility.nix
    ./customisation.nix
    ./direnv.nix

    # should only be imported directly or via system_profiles
    #./dhcp-all-interfaces.nix

    ./environment.nix
    ./firewall.nix
    ./locale.nix
    ./networking.nix
    #./plymouth.nix # increases boot time too much
    ./theming.nix
  ];
}
