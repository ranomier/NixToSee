{
  imports = [
    ./mini.nix

    {
      boot.isContainer = true;
      boot.kernel.enable = false;
    }
  ];
}
