{pkgs, rootPath, ...}:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    (rootPath + /system_profiles/server.nix)

    #(rootPath + /modules/hosting/wordpress-simple/kiezpalme.nix)
    #(rootPath + /modules/hosting/wordpress-simple/pertineo.nix)
    (rootPath + /modules/hosting/wordpress.nix)
  ];

  #services.mysql = {
  #  enable = true;
  #  package = pkgs.mariadb;
  #};

  services.cWordpress."example-site" = {
    enable = true;
    sitePort = 80;
  };

  services.cWordpress."example-site2" = {
    enable = true;
    sitePort = 81;
  };

  services.openssh.ports = [11522];
  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      (rootPath + /certificates/id_ed25519_ext-julia.pub)
    ];
  };
}
