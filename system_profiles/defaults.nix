{
  lib,
  pkgs,
  ...
}: {
  nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];

  # Disable if you don't want unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  nix = {
    # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
    # focused on correctness, usability, and growth –
    # and committed to doing right by its community.
    package = lib.mkDefault pkgs.lix;

    channel.enable = lib.mkDefault false;
  };

  imports = [
    ../modules/locale.nix
  ];
}
