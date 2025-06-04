{pkgs, ...}: let
  package = pkgs.librewolf;
in {
  imports = [
    ./brave.nix
    #./firefox.nix
    ./librewolf.nix
    ./nyxt.nix
  ];

  environment.sessionVariables.DEFAULT_BROWSER =
    "${package}/bin/"
    + builtins.replaceStrings [".desktop"] [""] package.desktopItem.name;

  xdg.mime.defaultApplications = let
    browser_desktop_file = package.desktopItem.name;
  in {
    "text/html" = browser_desktop_file;
    "x-scheme-handler/http" = browser_desktop_file;
    "x-scheme-handler/https" = browser_desktop_file;
  };
}
