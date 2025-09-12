{lib, ...}: {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = lib.mkDefault false;

  # force chromium and electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";
}

