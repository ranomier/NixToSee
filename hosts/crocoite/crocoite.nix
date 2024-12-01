{
  pkgs,
  inputs,
  ...
}: {
  networking.hostName = "crocoite"; # Define your hostname.

  #MANPAGER='nvim +Man!'

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
    overlays = with inputs.self.overlays; [
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
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
    # focused on correctness, usability, and growth –
    # and committed to doing right by its community.
    package = pkgs.lix;

    channel.enable = false;
  };

  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak

    #nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
    ./hardware-configuration.nix
    ./boot.nix

    ../../modules/locale.nix
    ../../modules/networking.nix
    ../../modules/boot_theming.nix

    ../../modules/specific_hardware/scan_and_print.nix
    ../../modules/specific_hardware/fwupd.nix
    ../../modules/specific_hardware/bluetooth.nix

    ../../modules/sec_auth/firejail.nix
    ../../modules/sec_auth/login-manager.nix
    ../../modules/sec_auth/users_and_permissions.nix
    ../../modules/sec_auth/ssh.nix

    ../../modules/software/software.nix
    ../../modules/software/virt.nix
    ../../modules/software/game.nix
    ../../modules/software/audio_video.nix
    ../../modules/software/obs-studio.nix

    ../../modules/wm_and_de/hyprland.nix

    ../../modules/pkg_mgrmnt/flatpak.nix
    ../../modules/pkg_mgrmnt/podman.nix
    ../../modules/pkg_mgrmnt/store_pkg_file.nix

    ../../modules/software/nix-helper/index.nix
    #../../modules/software/nix-helper/doc.nix
    ../../modules/software/nix-helper/nix-ld.nix

    ../../modules/software/browser/firefox.nix
    ../../modules/software/browser/brave.nix
    ../../modules/software/browser/nyxt.nix
  ];
}
