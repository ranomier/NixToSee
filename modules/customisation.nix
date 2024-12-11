{pkgs, ...}: {
  #MANPAGER='nvim +Man!'
  environment.systemPackages = [pkgs.neovim];
  environment.variables = {
    "MANPAGER" = "nvim +Man!";
    "EDITOR" = "nvim";
  };
}
