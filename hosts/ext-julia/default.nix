{pkgs, ...}:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/hosting/wordpress-simple/kiezpalme.nix
    ../../modules/hosting/wordpress-simple/pertineo.nix
    ../../modules/sec_auth/ssh-server.nix

    ../../system_profiles/server.nix
  ];

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.openssh.ports = [11522];
  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      ../../certificates/id_ed25519_ext-julia.pub
    ];
  };
}
