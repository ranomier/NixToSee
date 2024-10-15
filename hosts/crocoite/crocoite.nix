{
  pkgs,
  overlays,
  inputs,
  ...
}: {
  #MANPAGER='nvim +Man!'

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Allow unfree packages
  #unstable.config.allowUnfree = true;
  nixpkgs.config.allowUnfree = true;

  #nixpkgs.overlays = [ overlays.unstable-packages ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
  # focused on correctness, usability, and growth –
  # and committed to doing right by its community.
  nix.package = pkgs.lix;
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak

    #nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1
    ./hardware-configuration.nix

    ../../modules/basic_system_config.nix
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
    ../../modules/software/nix-helper/doc.nix
    ../../modules/software/nix-helper/nix-ld.nix

    ../../modules/software/browser/firefox.nix
    ../../modules/software/browser/brave.nix
  ];
}
