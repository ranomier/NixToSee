{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # move to homemanager?

    # Music
    amberol
    nuclear

    # Video
    #mpv

    # PDF
    #zathura
    sioyek

    # Image viewer
    #feh
    nomacs

    # image editor
    krita

    # Comunication
    unstable.mumble
    element-desktop

    keepassxc
    rustdesk-flutter
    timer
    unstable.prusa-slicer
    tenacity

    # fallback if something does not run on nixos
    distrobox
    distrobox-tui
  ];
}
