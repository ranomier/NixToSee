{inArgs, pkgs, ...}: {
  imports = [ inArgs.home-manager.nixosModules.home-manager ];

  environment.systemPackages = [ pkgs.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
