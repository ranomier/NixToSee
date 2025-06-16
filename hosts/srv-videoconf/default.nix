{rootPath, ...}: {
  imports = [
    ./hardware-configuration.nix

    (rootPath + /system_profiles/server.nix)
  ];
}
