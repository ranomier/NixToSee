{...}: {
  nixpkgs.config = {
    # Disable if you don't want unfree packages
    allowUnfree = true;
  };

  imports = [
    ./hardware-configuration.nix

    ../../system_profiles/defaults.nix
    ../../system_profiles/mini-container.nix
  ];
}
