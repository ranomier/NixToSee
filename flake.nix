{
  inputs = {
    # Main nix package repository
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # NixOS unstable
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # ready made hardware configurations. e.G.: Power saving
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # generating filesystems in different formats
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # additional user specific nix modules
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for managing flatpaks, like which ones are installed and which not
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = inArgs: import ./outputs.nix inArgs;
}
