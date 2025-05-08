{
  pkgs,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../system_profiles/defaults.nix
    ../../system_profiles/mini-container.nix
  ];
}
