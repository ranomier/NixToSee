{pkgs, ...}: let
  package = pkgs.firefox;
in {
  # The logical browser of choice
  programs.firefox = {
    enable = true;

    package = package;
  };
}
