{
  inputs = {
    # Main nix package repository
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # NixOS unstable
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # ready made hardware configurations. e.G.: Power saving
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # minimal mirror of the flake schema, but flips from a primary host approach to a primary feature approach
    flake-parts.url = "github:hercules-ci/flake-parts";

    # generating filesystems in different formats
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # additional user specific nix modules
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # theming
    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-secrets = {
      url = "path:/home/ranomier/Projects/nix-secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for managing flatpaks, like which ones are installed and which not
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = inputs: import ./outputs.nix inputs;
}
