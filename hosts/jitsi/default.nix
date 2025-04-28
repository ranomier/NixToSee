{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  #networking.hostName = "jitsi"; # Define your hostname.
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nixpkgs.config = {
    # Disable if you don't want unfree packages
    allowUnfree = true;
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
  # focused on correctness, usability, and growth –
  # and committed to doing right by its community.
  nix.package = pkgs.lix;

  imports = [
    ./hardware-configuration.nix

    ../../modules/locale.nix

    (modulesPath + "/profiles/perlless.nix")
    (modulesPath + "/profiles/minimal.nix")
    {
      environment.defaultPackages = [];
      boot.kernel.enable = false;
      boot.isContainer = true;
      nixpkgs.overlays = [(self: super: {})];
    }
    {
      # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
      # (the default) this is the recommended approach. When using systemd-networkd it's
      # still possible to use this option, but it's recommended to use it in conjunction
      # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
      networking.useDHCP = lib.mkDefault true;
      # networking.interfaces.ens18.useDHCP = lib.mkDefault true;
    }
  ];
  disabledModules = [
    (modulesPath + "/profiles/all-hardware.nix")
    (modulesPath + "/profiles/base.nix")
    #  <nixpkgs/nixos/modules/profiles/all-hardware.nix>
    #  <nixpkgs/nixos/modules/profiles/base.nix>
  ];
}
