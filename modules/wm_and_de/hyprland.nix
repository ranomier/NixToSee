{pkgs, ...}: {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # force chromium and electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        #xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
      ];
    };
  };
  # Enable the hyprland window manager with additions
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.setPath.enable = true;
      #package = pkgs.unstable.hyprland;
    };
    hyprlock = {
      enable = true;
      #package = pkgs.unstable.hyprlock;
    };
  };
  services.hypridle = {
    enable = true;
    #package = pkgs.unstable.hypridle;
  };

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
    waybar
    hyprpaper
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
