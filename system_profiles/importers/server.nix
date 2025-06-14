{rootPath, ...}: {
  imports = [
    (rootPath + /modules/customisation.nix)
    (rootPath + /modules/software/neovim.nix)
    (rootPath + /modules/software/packages/core.nix)
  ];
}
