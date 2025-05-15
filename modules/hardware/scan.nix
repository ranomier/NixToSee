{pkgs, ...}: {
  services.ipp-usb.enable = true; # enable usb support

  hardware.sane = {
    enable = true; # enables support for SANE scanners

    backends-package = pkgs.sane-backends.overrideAttrs (old: {
      configureFlags =
        (old.configureFlags or [])
        ++ [
          # "--localstatedir=/var" # `sane-backends` puts e.g. lock files in here, must not be in /nix/store
          # "--with-lockdir=/var/lock/sane" # `sane-backends` puts e.g. lock files in here, must not be in /nix/store

          # Ugly workaround for https://github.com/NixOS/nixpkgs/issues/273280#issuecomment-1848873028
          # Really we should make `sane-backends` be able to provide a real lock dir (e.g. `/var/lock/sane`).
          "--disable-locking"
        ];
    });
  };

  users.users.ranomier.extraGroups = ["scanner" "lp"];

  # only for the scan and maybe print clients
  environment.systemPackages = with pkgs; [
    simple-scan
  ];
}
