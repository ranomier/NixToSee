{
  networking.firewall = {
    enable = false;

    # Open ports in the firewall.
    allowedTCPPorts = [8080 10001 10002];
    allowedUDPPorts = [8080 10001 10002];
  };
}
