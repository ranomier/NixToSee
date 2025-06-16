{
  imports = [
    ./components/minify.nix
    ./components/nix-defaults.nix
    ./components/qemu.nix

    ./importers/general.nix
    ./importers/server.nix
  ];
}
