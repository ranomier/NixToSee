{pkgs, ...}: {
  # install and set neovim as MANPAGER
  environment.systemPackages = [pkgs.neovim];
  environment.variables = {
    "MANPAGER" = "nvim +Man!";

    # set neovim as default editor
    "EDITOR" = "nvim";
  };
}
