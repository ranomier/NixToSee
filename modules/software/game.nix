{pkgs, ...}: {
  programs.steam = {
    enable = true;

    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true;

    # Open ports in the firewall for Source Dedicated Server
    dedicatedServer.openFirewall = true;

    # Open ports in the firewall for Steam Local Network Game Transfers
    localNetworkGameTransfers.openFirewall = true;

    # enables a extra session for the login screen (get steam deck behavior)
    gamescopeSession.enable = true;

    # make proton-ge alway available
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };

  # steam-run: Run commands in the same FHS environment that is used for Steam
  environment.systemPackages = with pkgs; [steam-run];

  # Note that this is already enabled with programs.steam.enable = true;
  # but it might be usefull on systems without steam,
  # while still using steam hardware
  #hardware.steam-hardware.enable = true;
}
