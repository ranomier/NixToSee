{lib, ...}: {
  system = {
    rebuild.enableNg = lib.mkDefault false;
  };
}
