{
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/profiles/minimal.nix")
    (modulesPath + "/profiles/perlless.nix")

    {
      boot.isContainer = true;
      boot.kernel.enable = false;
      environment.defaultPackages = [];
      nixpkgs.overlays = [(self: super: {})];
    }
  ];

  disabledModules = [
    (modulesPath + "/profiles/all-hardware.nix")
    (modulesPath + "/profiles/base.nix")
  ];
}
