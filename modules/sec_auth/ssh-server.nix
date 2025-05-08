{lib, ...}: {
  services.openssh = {
    enable = true;

    ports = lib.mkDefault [38742];

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "yes";
      X11Forwarding = true;
    };
  };
}
