{
  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
  };

  services.blueman.enable = true; # provides blueman-applet and blueman-manager
}
