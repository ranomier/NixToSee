{
  inArgs,
  rootPath,
  config,
  ...
}: {
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    (rootPath + /system_profiles/server.nix)

    (rootPath + /modules/game/server/luanti)
    (rootPath + /modules/pkg_mgrmnt/unattended-updates.nix)
    inArgs.nix-secrets.nixos-modules.game-luanti
  ];

  environment.etc."bla".source = config.age.secrets.hello.path;

  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      (rootPath + /certificates/id_ed25519_game-luanti.pub)
    ];
  };

  services.journald.extraConfig = ''
    Storage=persistent
    SystemMaxUse=100M
    SystemKeepFree=50M
  '';
}
