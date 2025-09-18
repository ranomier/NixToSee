# This makes an installation smaller at the cost of
# features (and maybe even stability)
{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/minimal.nix")
    #(modulesPath + "/profiles/perlless.nix")
  ];

  disabledModules = [
    (modulesPath + "/profiles/all-hardware.nix")
    (modulesPath + "/profiles/base.nix")
  ];

  environment.defaultPackages = lib.mkDefault [];
  nixpkgs.overlays = lib.mkDefault [(self: super: {})];
}
