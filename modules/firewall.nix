{...}: {
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [8080 10001 10002];
  networking.firewall.allowedUDPPorts = [8080 10001 10002];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
