{ pkgs, ... }: {

  services = {
    ipp-usb.enable = true; # enable usb support

    # Enable CUPS to print documents.
    printing = {
      enable = true;

      drivers = [ (pkgs.callPackage ./kyocera-1325mfp.nix { }) ];
    };
  };

  # FIX: this seems ugly because of the specific username
  users.users.ranomier.extraGroups = [ "lp" ];

  hardware.printers = {
    ensurePrinters = [{
      name = "Home-Printer(USB)";
      location = "Home"; # Optional
      deviceUri = "usb://Kyocera/FS-1325MFP?serial=NZK2Y02746";
      model =
        "kyocera/Kyocera_FS-1325MFPGDI.ppd"; # Path relative to share/cups/model/
      ppdOptions = { PageSize = "A4"; };
    }];
    ensureDefaultPrinter = "Home-Printer(USB)";
  };
}
