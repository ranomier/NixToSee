{rootPath, ...}: {
  imports = [
    (rootPath + /modules/customisation.nix)
    (rootPath + /modules/sec_auth/ssh-server.nix)
    (rootPath + /modules/software/neovim.nix)
    (rootPath + /modules/software/packages/core.nix)
  ];
}
