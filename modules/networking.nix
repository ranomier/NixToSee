{
  pkgs,
  ...
}: {
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";

  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    IPv6 = {
      Enabled = true;
    };
    Settings = {
      AutoConnect = true;
    };
  };
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  #networking.useDHCP = lib.mkDefault true;

  # networking.interfaces.enp2s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [8080];
  networking.firewall.allowedUDPPorts = [8080];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
