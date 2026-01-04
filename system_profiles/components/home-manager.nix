{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  environment.systemPackages = [pkgs.home-manager];

  home-manager = {
    useUserPackages = lib.mkDefault true;
    useGlobalPkgs = lib.mkDefault true;
  };
}
