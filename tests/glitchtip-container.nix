{
  nixos-unstable,
  inputs,
  ...
}: {
  networking.nat = {
    enable = true;
    internalInterfaces = ["ve-+"];
    externalInterface = "ens3";
    # Lazy IPv6 connectivity for the container
    enableIPv6 = true;
  };

  containers.glitchtip = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "192.168.100.10";
    localAddress = "192.168.100.11";
    hostAddress6 = "fc00::1";
    localAddress6 = "fc00::2";
    path =
      (nixos-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            boot.isContainer = true;
            #services.glitchtip = {
            #  enable = true;
            #  listenAddress = "0.0.0.0";
            #  settings = {
            #    GLITCHTIP_DOMAIN = "http://localhost";
            #  };
            #};
            #services = {
            #  logrotate.enable = lib.mkForce false;
            #  httpd = {
            #    enable = true;
            #    adminAddr = "admin@example.org";
            #  };
            #};

            # imports = [
            #   #(modulesPath + "/profiles/perlless.nix")
            #   (modulesPath + "/profiles/minimal.nix")
            #   {
            #     environment.defaultPackages = [ ];
            #     boot.kernel.enable = false;
            #     boot.isContainer = true;
            #     nixpkgs.overlays = [ (self: super: { }) ];
            #   }
            # ];
            # disabledModules = [
            #   (modulesPath + "/profiles/all-hardware.nix")
            #   (modulesPath + "/profiles/base.nix")
            # ];

            networking = {
              firewall.allowedTCPPorts = [80];

              # Use systemd-resolved inside the container
              # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
              useHostResolvConf = false;
            };

            services.resolved.enable = true;

            system.stateVersion = "25.05";
          }
        ];
      })
      .outPath;
  };
}
