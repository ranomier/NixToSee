{config, pkgs, ...}:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
 
    ../../modules/hosting/wordpress.nix
    ../../modules/sec_auth/ssh-server.nix

    ../../system_profiles/server.nix
  ];

  services.cWordpress = {
    enable = true;
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
