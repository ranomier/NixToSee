{pkgs, ...}: let
  package = pkgs.librewolf;
in {
  # The logical browser of choice
  programs.firefox = {
    enable = true;

    package = package;
  };
}
