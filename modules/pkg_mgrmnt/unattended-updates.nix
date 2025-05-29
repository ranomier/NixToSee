{inArgs, ...}: {
  system.autoUpgrade = {
    enable = true;
    flake = inArgs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
    dates = "07:00";
    randomizedDelaySec = "45min";
  };
}
