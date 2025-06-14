# For when to deploy to a container,
# can be used with minify to make things smaller
{lib, ...}: {
  boot.isContainer = lib.mkDefault true;
  boot.kernel.enable = lib.mkDefault false;
}
