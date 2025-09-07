{pkgs, ...}: {
  #imports = [
  #  ./components/rofi.nix
  #];

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
      #package = pkgs.unstable.hyprland;

      systemd.setPath.enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    hyprlock = {
      enable = true;
      #package = pkgs.unstable.hyprlock;
    };
  };

  services = {
    hypridle = {
      enable = true;
      #package = pkgs.unstable.hypridle;
    };

    # for mounting stuff, also needs a auth agent like lxqt.lxqt-policykit
    gvfs.enable = true;
  };

  environment = {
    pathsToLink = ["/share/foot"];

    systemPackages = with pkgs; [
      hyprsunset
      hyprpolkitagent
      hyprutils
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
  };
}
