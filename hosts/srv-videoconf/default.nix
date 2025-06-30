{rootPath, ...}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    (rootPath + /system_profiles/server.nix)
  ];
  services.galene = {
    enable = true;

    insecure = true;
  };

  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      (rootPath + /certificates/id_ed25519_srv-videoconf.pub)
    ];
  };

}
