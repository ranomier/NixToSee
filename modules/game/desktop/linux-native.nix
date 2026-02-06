{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.sgt-puzzles
    pkgs.xonotic
  ];
}
