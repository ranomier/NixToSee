{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../system_profiles/defaults.nix
    ../../system_profiles/mini.nix
    ../../system_profiles/server.nix

    ../../modules/game/server/luanti
    ../../modules/sec_auth/ssh-server.nix
  ];

  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      ../../certificates/id_ed25519_game-luanti.pub
    ];
  };
}
