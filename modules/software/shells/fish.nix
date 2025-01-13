{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;
      useBabelfish = true;
      shellInit = ''
        starship init fish | source
      '';
    };
    nix-index.enableFishIntegration = true;
    direnv.enableFishIntegration = true;
    foot.enableFishIntegration = true;
  };
  environment.systemPackages = [pkgs.starship];
}
