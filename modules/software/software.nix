{pkgs, ...}: {
  # also opens the TCP and UDP port from 1714 to 1764
  programs.kdeconnect.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = let
    amberol_wrapper = pkgs.writeShellScriptBin "amberol" ''
      export GDK_BACKEND='x11'
      exec "${pkgs.amberol}/bin/amberol" "$@"
    '';
  in
    with pkgs; [
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
      amberol_wrapper
      amberol
      nuclear
      mpv
      zathura
      libreoffice
      #feh
      nomacs
      #unstable.obsidian
      keepassxc
      #minecraft
      element-desktop
      rustdesk-flutter
      timer
      rtl-sdr
      gqrx
    ];
  hardware.rtl-sdr.enable = true;
  users.users."ranomier".extraGroups = ["plugdev"];

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
