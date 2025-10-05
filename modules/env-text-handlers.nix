{pkgs, ...}: {
  # install and set neovim as MANPAGER
  environment = {
    systemPackages = [pkgs.neovim];
    variables = {
      # set neovim as default editor
      "EDITOR" = "nvim";

      # use neovim as manpager! :3
      "MANPAGER" = "nvim +Man!";
    };
  };
}
