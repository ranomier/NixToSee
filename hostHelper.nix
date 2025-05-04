inArgs: hostname: hostOptions:
let
  nixosSystem =
    if (hostOptions ? unstable && hostOptions.unstable)
      then inArgs.nixos-unstable.lib.nixosSystem
      else inArgs.nixpkgs.lib.nixosSystem;
in
  nixosSystem {
    specialArgs = {inherit inArgs;};
    modules = [
      {networking.hostName = hostname;}
      (./hosts/${hostname})
    ];
  }
