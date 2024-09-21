{ pkgs, ... }: {
  # Allow unfree packages
  #unstable.config.allowUnfree = true;
  nixpkgs.config.allowUnfree = true;

  # also opens the TCP and UDP port from 1714 to 1764
  programs.kdeconnect.enable = true;

  # for running android apps
  virtualisation.waydroid.enable =
    true; # also starts the systemd service waydroid-container

  # virt manager, for running VM's
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  environment.pathsToLink = [ "/share/foot" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = let
    amberol_wrapper = pkgs.writeShellScriptBin "amberol" ''
      export GDK_BACKEND='x11'
      exec "${pkgs.amberol}/bin/amberol" "$@"
    '';
  in with pkgs; [
    # low level stuff
    efibootmgr
    #exfat
    exfatprogs
    greetd.greetd
    greetd.tuigreet
    killall
    vulnix

    # hardware
    brightnessctl
    usbutils
    lm_sensors

    # neovim
    unstable.neovim
    git
    gnumake
    gcc
    nodePackages.npm
    nodejs-slim
    python3
    fd
    nodejs-slim
    cargo
    rustc

    # tooling
    htop
    ncdu
    wget
    miniserve
    file
    unzip
    tmux
    qemu
    home-manager

    # move to homemanager?
    lxqt.pavucontrol-qt
    mumble
    amberol_wrapper
    amberol
    mpv
    zathura
    feh
    #unstable.obsidian
    keepassxc
    #minecraft
    element-desktop
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    dina-font
    proggyfonts
    font-awesome

    jetbrains-mono
    fira-code
    fira-code-symbols
    #droid-sans-mono
    (nerdfonts.override {
      fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ];
    })
  ];
}