{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # low level stuff
    efibootmgr
    #exfat
    sshfs
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
    gitui
    lazygit
    meld

    gnumake
    gcc
    nodePackages.npm
    nodejs-slim
    python3
    nodejs-slim
    cargo
    rustc

    # tooling
    btop
    unstable.yt-dlp
    miniserve
    fzf
    fd
    qemu
    dfc
    sops

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
    unstable.prusa-slicer
    tenacity
  ];
}
