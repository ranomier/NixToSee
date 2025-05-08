{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      useBabelfish = true;
    };
    nix-index.enableFishIntegration = true;
    direnv.enableFishIntegration = true;
    foot.enableFishIntegration = true;
  };
}
