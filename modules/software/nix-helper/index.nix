{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nix-index
    ];
 
    programs.command-not-found.enable = false;
    # for home-manager, use programs.bash.initExtra instead
    programs.bash.interactiveShellInit = ''
      source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
    '';
}
