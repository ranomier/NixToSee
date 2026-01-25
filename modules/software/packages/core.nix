{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    file
    git
    htop
    ncdu
    p7zip
    pciutils
    ripgrep
    tmux
    unzip
    wget
  ];
}
