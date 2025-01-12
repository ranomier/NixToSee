{pkgs, ...}: {
  # for running android apps
  virtualisation.waydroid.enable =
    true; # also starts the systemd service waydroid-container

  # virt manager, for running VM's
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    virt-viewer
  ];
}
