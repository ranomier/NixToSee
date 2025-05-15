{pkgs, ...}: {
  # virt manager, for running VM's
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    virt-viewer
  ];
}
