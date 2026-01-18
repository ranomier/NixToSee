{inputs, ...}: {
  flake = {
    nixosConfigurations."crocoite" = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        rootPath = inputs.self;
      };

      modules = [
        ./crocoite
        {system.stateVersion = "24.05";}
      ];
    };
  };
}
#inArgs: let
#  hostHelper = import ../lib/hostHelper.nix inArgs;
#in
#  builtins.mapAttrs (hostName: hostOptions: (hostHelper hostName hostOptions)) {
#    crocoite = {stateVersion = "24.05";};
#
#    #srv-videoconf = {stateVersion = "25.05";};
#
#    game-luanti = {stateVersion = "25.05";};
#
#    ext-julia = {stateVersion = "25.05";};
#
#    testvm = {
#      stateVersion = "25.11";
#      unstable = true;
#    };
#  }
# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

