{
  imports = let
    packages = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        tmux
        wget
      ];
    };
  in [
    ./defaults.nix
    ./mini.nix

    ../modules/customisation.nix
    ../modules/software/neovim.nix

    packages
  ];
}
