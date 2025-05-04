{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  # Disable if you don't want unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
  # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
  # focused on correctness, usability, and growth –
  # and committed to doing right by its community.
    package = pkgs.lix;

    settings.experimental-features = ["nix-command" "flakes"];
  };

  imports = [
    ./hardware-configuration.nix

    ../../modules/locale.nix

    ../../system_profiles/mini-container.nix
  ];
}
