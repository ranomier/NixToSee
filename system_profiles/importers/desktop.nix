# This basicly imports the whole modules folder
{rootPath, ...}: {
  imports = [
    (rootPath + /modules)

    (rootPath + /modules/game/desktop)

    (rootPath + /modules/hardware)

    (rootPath + /modules/pkg_mgrmnt)

    (rootPath + /modules/sec_auth)

    (rootPath + /modules/software)
    (rootPath + /modules/software/browser)
    (rootPath + /modules/software/nix-helper)
    (rootPath + /modules/software/office)
    (rootPath + /modules/software/shells)

    (rootPath + /modules/users)

    (rootPath + /modules/wm_and_de)
  ];
}
