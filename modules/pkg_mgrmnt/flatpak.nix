{ ... }: {
  services.flatpak = {
    enable = true;
    update.auto = {
      enable = false;
      onCalendar = "weekly";
    };
    uninstallUnmanaged = true;

    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        args = "--prio=99";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];

  };
}
