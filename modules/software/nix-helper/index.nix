{pkgs, ...}: {
  # disable default command not found feature
  programs.command-not-found.enable = false;

  environment.systemPackages = with pkgs; [
    nix-index
    comma
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  # for home-manager, use programs.bash.initExtra instead
  #programs.bash.interactiveShellInit = ''
  #  source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
  #'';
}
