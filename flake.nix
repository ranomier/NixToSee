{
  ######
  inputs = {
    ######
    # NOTE: Replace "nixos-23.11" with that which is in system.stateVersion of
    # configuration.nix. You can also use latter versions if you wish to
    # upgrade.
    # INFO: Use github:org/repo/?ref=<tag> to pin releases.

    # Main nix package repository
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # ready made hardware configurations. e.G.: Power saving
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # NixOS unstable channel
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # for managing flatpaks, like which ones are installed and which not
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  #######
  outputs =
    #######
    { self, nixpkgs, nixos-hardware, nixpkgs-unstable, nix-flatpak, home-manager, ... }: let
      overlays =  {
        unstable-packages = final: prev: {
          unstable = import nixpkgs-unstable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
      }; 
    in {
      # NOTE: 'nixos' is the default hostname set by the installer
      nixosConfigurations.crocoite = nixpkgs.lib.nixosSystem {

        modules = [
          ( let
            pkgs2 = nixpkgs.legacyPackages."x86_64-linux";
          in 
          {
            nixpkgs.overlays = [ overlays.unstable-packages ];

            nix.settings.experimental-features = [ "nix-command" "flakes" ];

            # https://lix.systems/ Lix is a modern, delicious implementation of the Nix package manager,
            # focused on correctness, usability, and growth – 
            # and committed to doing right by its community.
            nix.package = pkgs2.lix;

            # This value determines the NixOS release from which the default
            # settings for stateful data, like file locations and database versions
            # on your system were taken. It‘s perfectly fine and recommended to leave
            # this value at the release version of the first install of this system.
            # Before changing this value read the documentation for this option
            # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
            system.stateVersion = "24.05"; # Did you read the comment?
          })
          nix-flatpak.nixosModules.nix-flatpak

          ./hardware-configuration.nix
          #nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen1

          ./modules/basic_system_config.nix
          ./modules/networking.nix
          ./modules/boot_theming.nix

          ./modules/specific_hardware/scan_and_print.nix
          ./modules/specific_hardware/fwupd.nix
          ./modules/specific_hardware/bluetooth.nix

          ./modules/sec_auth/firejail.nix
          ./modules/sec_auth/login-manager.nix
          ./modules/sec_auth/users_and_permissions.nix
          ./modules/sec_auth/ssh.nix

          ./modules/software/software.nix
          ./modules/software/game.nix
          ./modules/software/audio_video.nix
          ./modules/software/obs-studio.nix

          ./modules/wm_and_de/hyprland.nix

          ./modules/pkg_mgrmnt/flatpak.nix
          ./modules/pkg_mgrmnt/podman.nix
          ./modules/pkg_mgrmnt/store_pkg_file.nix

          ./modules/software/nix-helper/index.nix
          ./modules/software/nix-helper/doc.nix
          ./modules/software/nix-helper/nix-ld.nix

          ./modules/software/browser/firefox.nix
          ./modules/software/browser/brave.nix
        ];
      };
    };
}
