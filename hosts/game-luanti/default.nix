{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix

    ../../modules/game/server/luanti
    ../../modules/sec_auth/ssh-server.nix

    ../../system_profiles/server.nix
  ];

  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      ../../certificates/id_ed25519_game-luanti.pub
    ];
  };
}
