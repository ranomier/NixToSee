{
  inArgs,
  pkgs,
  lib,
  ...
}: {
  imports = [inArgs.home-manager.nixosModules.home-manager];

  environment.systemPackages = [pkgs.home-manager];

  home-manager = {
    useUserPackages = lib.mkDefault true;
    useGlobalPkgs = lib.mkDefault true;
  };
}
