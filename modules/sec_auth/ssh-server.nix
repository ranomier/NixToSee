{lib, ...}: {
  services.openssh = {
    enable = true;

    ports = lib.mkDefault [10522];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "yes";
      X11Forwarding = true;
    };
  };
}
