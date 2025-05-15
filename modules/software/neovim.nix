{pkgs, ...}: let
  makeDiff = name:
    pkgs.writeShellScriptBin name ''
      #!/usr/bin/env bash
      if [ $# -lt 2 ]; then
        echo "Usage: ${name} <file1> <file2> [more args…]" >&2
        exit 1
      fi
      exec nvim -d "$@"
    '';
in {
  environment.systemPackages = [
    (makeDiff "vimdiff")
    (makeDiff "nvimdiff")
  ];
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
