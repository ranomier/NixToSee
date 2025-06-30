{
  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;
    # efiSupport = true;
    # efiInstallAsRemovable = true;
    # Define on which hard drive you want to install Grub.
    device = "/dev/vda"; # or "nodev" for efi only
  };
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
}

