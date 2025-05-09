{pkgs, ...}: let
  port = 10523;
in {
  services.minetest-server = {
    enable = true;

    gameId = "asuna";
    port = port;
  };

  # open port since luanti does not do it by itself
  networking.firewall = {
    allowedUDPPorts = [port];
  };

  # install luanti seperatly so it is available through the command line
  environment.systemPackages = with pkgs; [
    luanti
  ];
}
