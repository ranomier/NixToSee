{
  lib,
  ...
}: {
  imports = [
    ./mini.nix

    {
      boot.isContainer = lib.mkDefault true;
      boot.kernel.enable = lib.mkDefault false;
    }
  ];
}
