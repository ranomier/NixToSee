{
  services.flatpak = {
    packages = [
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
      {
        origin = "flathub";
        appId = "io.gpt4all.gpt4all";
      } # Local chat AI
      {
        origin = "flathub";
        appId = "md.obsidian.Obsidian";
      } # note taking and brain organising
      {
        origin = "flathub";
        appId = "com.parsecgaming.parsec";
      } # remote dekstop

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

      # games
      {
        origin = "flathub";
        appId = "com.etlegacy.ETLegacy";
      } # shooter
      {
        origin = "flathub";
        appId = "org.js.nuclear.Nuclear";
      }

      #"com.obsproject.Studio" #this is another way to write it
    ];
  };
}
