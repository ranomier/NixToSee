{pkgs, ...}: {
  #environment.systemPackages = with pkgs; [ ];
  # hardware.steam-hardware.enable = true; # Note that this is already enabled with programs.steam.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.steam.gamescopeSession.enable = true;
  #### FHS environment only
  # This will only make partial installation - provide the script, which creates the typical environment expected by proprietary games and software on regular Linux, allowing to run such software without patching. Useful if you plan to run games downloaded from the internet.
  # Note that this is not necessary for clients installed from Nixpkgs (like Minigalaxy or Itch), which already use the FHS environment.
  # There are two options to install the FHS environment. The first is to install steam-run.

  #Example snippet of configuration.nix:

  #  environment.systemPackages = with pkgs; [
  #    steam-run
  #  ];

  # Another option, in case you need more flexibility, is to directly reference the part of steam metapackage.

  # Example snippet of configuration.nix:

  #  environment.systemPackages = with pkgs; [
  #    (steam.override { /* Your overrides here */ }).run
  #  ];
  # Install the game by setting the executable attribute on the installer and then running it via steam-run ./your_installer.sh. After installation, edit the "~/.local/share/applications/your_game.desktop" and replace the exec line from Exec="/home/user/game/start.sh" "" with Exec="steam-run" "/home/user/game/start.sh".

  environment.systemPackages = with pkgs; [steam-run];

  programs.steam.extraCompatPackages = with pkgs; [proton-ge-bin];
}
