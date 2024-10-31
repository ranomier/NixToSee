{lib, ...}: {
  services.flatpak.enable = true;
  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = true;

  services.flatpak.remotes = lib.mkOptionDefault [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
  ];

  services.flatpak.packages = [
    {
      origin = "flathub";
      appId = "com.github.tchx84.Flatseal";
    } # flatpak permisssion gui
    {
      origin = "flathub";
      appId = "com.mojang.Minecraft";
    } # Lego for adults
    {
      origin = "flathub";
      appId = "de.schmidhuberj.DieBahn";
    } # Public transport connection viewer
    {
      origin = "flathub";
      appId = "com.github.hugolabe.Wike";
    } # Wikpedia, but in nice
    #{ origin = "flathub";   appId = "com.jeffser.Alpaca"; }          # Local chat AI
    {
      origin = "flathub";
      appId = "io.gpt4all.gpt4all";
    } # Local chat AI
    {
      origin = "flathub";
      appId = "md.obsidian.Obsidian";
    } # note taking and brain organising

    # messenger
    {
      origin = "flathub";
      appId = "org.signal.Signal";
    }
    {
      origin = "flathub";
      appId = "org.telegram.desktop";
    }
    {
      origin = "flathub";
      appId = "dev.vencord.Vesktop";
    } # More usable discord for linux
    {
      origin = "flathub";
      appId = "io.github.Soundux";
    } # soundboard

    #"com.obsproject.Studio" #this is another way to write it
  ];
}
