{
  pkgs,
  ...
}: {
  home-manager.users."ranomier" = {
    stylix.iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      dark = "Gruvbox-Plus-Dark";
    };
    home.stateVersion = "25.05";
  };
}
