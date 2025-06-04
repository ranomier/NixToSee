{ pkgs, lib, ... }: let
  _pull = pkgs.writeShellScript "pull" ''
    export GIT_SSH_COMMAND='ssh -i /var/lib/minetest/.ssh/id_ed25519_temp -o IdentitiesOnly=yes'
    git -C /var/lib/minetest/.minetest/games/EinsDreiDreiSieben pull
  '';
  pull = _pull.outPath;

  _restart = pkgs.writeShellScript "restart" ''
    echo "before"
    systemctl restart minetest-server.service
    echo "after"
  '';
  restart = _restart.outPath;

in {
  users.users."minetest".linger = true;
  services.olivetin = {
    enable = true;
    settings = {
      actions = [
        {
          title = "puuuull!";
          shell = "/run/wrappers/bin/sudo -u minetest - ${pull}";
          popupOnStart = "execution-dialog-stdout-only";
          icon = "&#11015;";
        }
        {
          title = "restart";
          shell = "/run/wrappers/bin/sudo -u minetest - ${restart}";
          popupOnStart = "execution-dialog-stdout-only";
          icon = "&#11015;";
        }
      ];
    };

    path = [
      pkgs.git
      pkgs.openssh
    ];
  };
  security.sudo-rs.extraRules = [
    {
      users = [ "olivetin" ];
      runAs = "minetest";
      commands = [
        {
          command = pull;
          options = [ "NOPASSWD" ];
        }
      ];
    }
    {

      users = [ "olivetin" ];
      runAs = "root";
      commands = [
        {
          command = restart;
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
