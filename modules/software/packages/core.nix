{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    file
    git
    htop
    ncdu
    p7zip
    ripgrep
    tmux
    unzip
    wget
  ];
}
