{
  config,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (self: super: {
      qtile-unwrapped = super.qtile-unwrapped.overrideAttrs (_: rec {
        postInstall = let
          qtileSession = ''
            [Desktop Entry]
            Name=Qtile Wayland
            Comment=Qtile on Wayland
            Exec=qtile start -b wayland
            Type=Application
          '';
        in ''
          mkdir -p $out/share/wayland-sessions
          echo "${qtileSession}" > $out/share/wayland-sessions/qtile.desktop
        '';
        passthru.providedSessions = ["qtile"];
      });
    })
  ];

  services.xserver.displayManager.sessionPackages = [pkgs.qtile-unwrapped];
  services.xserver.windowManager.qtile.enable = true;

  # for mounting stuff, also needs a auth agent like lxqt.lxqt-policykit
  services.gvfs.enable = true;

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

  environment.pathsToLink = ["/share/foot"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # for tiling window manager
    foot
    foot.themes
    wofi
    wl-clipboard # for waydroid and maybe more
    wlogout
    pamixer
    #unstable.kanshi
    shikane
    dunst

    # audio
    mixxc
    ncpamixer

    # for screenshot + annotation
    grim
    slurp
    satty
    flameshot

    # theming
    gruvbox-plus-icons
    gruvbox-gtk-theme
    kde-gruvbox
    capitaine-cursors-themed
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    # polkit auth agent
    lxqt.lxqt-policykit

    # file manager
    nautilus
  ];
}
