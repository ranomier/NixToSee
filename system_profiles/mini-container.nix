{lib, ...}: {
  boot.isContainer = lib.mkDefault true;
  boot.kernel.enable = lib.mkDefault false;

  imports = [./mini.nix];
}
