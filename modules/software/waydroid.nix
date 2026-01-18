{pkgs, ...}: {
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  environment.systemPackages = [ pkgs.unstable.waydroid-helper ];

  services.displayManager.sessionPackages = let
    waydroidSession = pkgs.writeTextFile {
      name = "waydroid-wayland-session";
      destination = "/share/wayland-sessions/waydroid.desktop";
      text = ''
        [Desktop Entry]
        Name=Waydroid
        Comment=Android OS in a container
        Exec=${pkgs.cage}/bin/cage -s -- ${pkgs.waydroid}/bin/waydroid show-full-ui
        Type=Application
      '';
      # This is the critical requirement for NixOS
      # It must match the filename "waydroid" from waydroid.desktop
      passthru.providedSessions = [ "waydroid" ];
    };
  in [ waydroidSession ];
}
