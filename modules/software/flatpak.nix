{
  services.flatpak = {
    packages = [
      {
        # flatpak permisssion gui
        origin = "flathub";
        appId = "com.github.tchx84.Flatseal";
      }
      {
        # Local chat AI
        origin = "flathub";
        appId = "io.gpt4all.gpt4all";
      }
      {
        # note taking and brain organising
        origin = "flathub";
        appId = "md.obsidian.Obsidian";
      }
      {
        # remote dekstop
        origin = "flathub";
        appId = "com.parsecgaming.parsec";
      }
      {
        # electron media player (youtube and co)
        origin = "flathub";
        appId = "org.js.nuclear.Nuclear";
      }

      # messenger
      {
        # good e2ee, but centralized
        origin = "flathub";
        appId = "org.signal.Signal";
      }
      {
        # bad/no e2ee, but centralized :3
        origin = "flathub";
        appId = "org.telegram.desktop";
      }
      {
        # discord, no privacy
        origin = "flathub";
        appId = "dev.vencord.Vesktop";
      }
      {
        # soundboard for chat apps
        origin = "flathub";
        appId = "io.github.Soundux";
      }

      # games
      {
        # shooter
        origin = "flathub";
        appId = "com.etlegacy.ETLegacy";
      }
      {
        # Lego for adults
        origin = "flathub";
        appId = "com.mojang.Minecraft";
      }
      {
        # Lego for real adults
        origin = "flathub";
        appId = "org.luanti.luanti";
      }

      #"com.obsproject.Studio" #this is another way to write it
    ];
  };
}
