{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
    btop
    ncdu
    wget
    unstable.yt-dlp
    miniserve
    file
    unzip
    tmux
    fzf
    ripgrep
    qemu
    home-manager
    dfc
    p7zip

    # move to homemanager?
    unstable.mumble
    amberol
    mpv
    nuclear
    #zathura
    sioyek
    #feh
    nomacs
    #unstable.obsidian
    keepassxc
    #minecraft
    element-desktop
    rustdesk-flutter
    timer
    prusa-slicer
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
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
      fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono"];
    })
  ];
}
