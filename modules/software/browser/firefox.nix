{ pkgs, ... }: {
  # The logical browser of choice
  programs.firefox.enable = true;

  xdg.mime.defaultApplications = let 
    browser_desktop_file = "firefox.desktop";
  in {
    "text/html" = browser_desktop_file;
    "x-scheme-handler/http" = browser_desktop_file;
    "x-scheme-handler/https" = browser_desktop_file;
  };
  environment.sessionVariables.DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";
}
