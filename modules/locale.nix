{
  # Configure console keymap
  console.keyMap = "de";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  i18n = {
    # Select internationalisation properties.
    defaultLocale = "en_GB.UTF-8";

    #supportedLocales = [
    #  "en_GB.UTF-8"
    #  "en_US.UTF-8"
    #  "de_DE.UTF-8"
    #];

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
}
