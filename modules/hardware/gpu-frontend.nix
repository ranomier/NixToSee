{pkgs, ...}: {
  environment.systemPackages = [ pkgs.lact ];

  systemd = {
    packages = [ pkgs.lact ];
    services.lactd.wantedBy = ["multi-user.target"];
  };
}
