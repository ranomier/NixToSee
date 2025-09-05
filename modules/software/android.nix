{pkgs, ...}: {
  # for running android apps
  # also starts the systemd service waydroid-container
  virtualisation.waydroid.enable = true;

  environment.systemPackages =  [ pkgs.unstable.waydroid-helper ];
}
