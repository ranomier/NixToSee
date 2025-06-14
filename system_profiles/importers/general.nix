# This loads some "general" defaults
{rootPath, ...}: {
  imports = [
    (rootPath + /modules/locale.nix)
    (rootPath + /modules/sec_auth/sudo-rs.nix)
  ];
}
