{
  imports = [
    ./hardware-configuration.nix

    ../../system_profiles/defaults.nix
    ../../system_profiles/mini-container.nix
  ];

  users = let
    username = "root";
  in {
    users."${username}".openssh.authorizedKeys.keyFiles = [
      /etc/nixos/ssh/authorized_keys.d/${username}
    ];
  };
}
