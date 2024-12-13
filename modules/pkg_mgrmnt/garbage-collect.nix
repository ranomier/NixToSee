{ ... }: {
  nix = {
    optimise = {
      automatic = true;
      dates = [ "16:00" "08:00" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
      persistent = true;
      randomizedDelaySec = "1h";
    };
  };
}
