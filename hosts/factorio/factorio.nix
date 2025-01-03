{pkgs, ...}: {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  nixpkgs = {
    # You can add overlays here
    #overlays = with inputs.self.overlays; [
    # Add overlays your own flake exports (from overlays and pkgs dir):
    #additions
    #modifications
    #unstable-packages

    # You can also add overlays exported from other flakes:
    # neovim-nightly-overlay.overlays.default

    # Or define it inline, for example:
    # (final: prev: {
    #   hi = final.hello.overrideAttrs (oldAttrs: {
    #     patches = [ ./change-hello-to-hi.patch ];
    #   });
    # })
    #];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
  # focused on correctness, usability, and growth –
  # and committed to doing right by its community.
  #nix.package = pkgs.lix;
  imports = [
    #nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
    #./hardware-configuration.nix
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/locale.nix
    #../../modules/game/server/factorio/factorio.nix

    <nixpkgs/nixos/modules/profiles/perlless.nix>
    <nixpkgs/nixos/modules/profiles/headless.nix>
    <nixpkgs/nixos/modules/profiles/minimal.nix>

    {
      programs.command-not-found.enable = false;
      environment.defaultPackages = [];
      xdg = {
        icons.enable = false;
        mime.enable = false;
        sounds.enable = false;
      };
      documentation.man.enable = false;
      documentation.nixos.enable = false;
    }
  ];
  disabledModules = [
    <nixpkgs/nixos/modules/profiles/all-hardware.nix>
    <nixpkgs/nixos/modules/profiles/base.nix>
  ];
}
