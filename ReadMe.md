# [NixToSee](https://git.katzies.win/Ranomier/NixToSee)

*nichts* in german means nothing, if you say it fast it sounds like nix.

[Beautiful button to my notes](docs/notes)

## folder structure

### certificates

Should only contain public certificates. Though i am thinking about making even
them a secret with the future (r)age-nix setup

### dev_shells

Each dev-shell should have it's file or folder, even the default one

### experiments

The feel free folder, but don't go overboard, it should be temporary or interim stuff.

### hosts

Each host should have a folder with a default.nix in it. This file should import
from system_profiles and can import specific things, but at some point just
create a new system_profile. Especially when multiple hosts share imports

### lib

nix functions, that can be used around this repo. Please not on the outside

### modules

Most functionality is in here atm, not well defined yet.
But basically just NixOS options

### overlays

nixpkgs overlay, right now only used for nixos-unstable

### system_profiles

This whole folder is for the most part just a system to clean up importing

- Files in the [system_profiles](system_profiles) directory:
  - Should never import anything from parent directories
  - Can import things from the child directories
  - The [importers](system_profiles/importers) directory:
    - Should only import things outside (above/parent) of the [system_profiles](system_profiles) directories.
    - Probably only from the module directory or maybe a future nix-modules directory,
      this rule is not set in stone yet
    - Should **not** import anything outside of this repository
  - The [components](system_profiles/components) directory:
    - Should never import anything from this repository
    - It can import things from nixpkgs
    - Should set only basic "system" wide settings
      ("system" is not well defined)
      NixOS has profiles this should be a similar concept to them
      - [NixOS profiles](https://github.com/NixOS/nixpkgs/tree/master/nixos/modules/profiles)
      - [NixOS manual on profiles](https://nixos.org/manual/nixos/stable/#ch-profiles)
