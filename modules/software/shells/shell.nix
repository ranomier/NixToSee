{pkgs, ...}: {
  # everyone should use zsh xD
  users.defaultUserShell = pkgs.zsh;
  # Prevent the new user dialog in zsh

  # supports many shell so it lives here
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
    presets = [
      "jetpack"
    ];
  };
}
