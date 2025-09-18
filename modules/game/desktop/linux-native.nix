{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.sgt-puzzles
  ];
}
