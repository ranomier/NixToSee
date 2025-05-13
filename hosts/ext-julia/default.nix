{config, pkgs, ...}:{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ((import ./wordpress.nix) {config=config; pkgs=pkgs; siteName="shop.kiezpalme.de"; port=80;})
    ../../modules/sec_auth/ssh-server.nix

    ../../system_profiles/server.nix
  ];

  services.openssh.ports = [11522];
  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      ../../certificates/id_ed25519_ext-julia.pub
    ];
  };
}
