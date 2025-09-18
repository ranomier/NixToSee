{
  pkgs,
  rootPath,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    (rootPath + /system_profiles/server.nix)
    (rootPath + /modules/pkg_mgrmnt/unattended-updates.nix)

    (rootPath + /modules/hosting/wordpress-simple/kiezpalme.nix)
    (rootPath + /modules/hosting/wordpress-simple/pertineo.nix)
    #(rootPath + /modules/hosting/wordpress.nix)
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings.mysqld.bind-address = "127.0.0.1";
  };

  #services.cWordpress."example-site" = {
  #  enable = true;
  #  sitePort = 80;
  #};

  #services.cWordpress."example-site2" = {
  #  enable = true;
  #  sitePort = 81;
  #};

  services.openssh.ports = lib.mkForce [11522];
  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      (rootPath + /certificates/id_ed25519_ext-julia.pub)
    ];
  };
}
