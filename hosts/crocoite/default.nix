{
  pkgs,
  inArgs,
  modulesPath,
  nixos-unstable,
  ...
}: {
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  #nixpkgs.overlays = [ overlays.unstable-packages ];
  nixpkgs = {
    # You can add overlays here
    overlays = with inArgs.self.overlays; [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      #additions
      #modifications
      unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];

  };



  imports = [
    # steam and other stuff seems to depend on perl
    #"${modulesPath}/profiles/perlless.nix"

    inArgs.nix-flatpak.nixosModules.nix-flatpak

    #nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
    ./hardware-configuration.nix
    ./boot.nix

    ../../modules

    ../../modules/users

    ../../modules/hardware

    ../../modules/sec_auth

    ../../modules/software
    ../../modules/software/browser
    ../../modules/software/nix-helper
    ../../modules/software/shells
    ../../modules/software/office

    ../../modules/wm_and_de

    ../../modules/pkg_mgrmnt
    
    ../../system_profiles/defaults.nix
    # ../../tests
  ];
}
