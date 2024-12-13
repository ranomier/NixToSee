{...}: {
  imports = [
    ./bluetooth.nix
    ./fwupd.nix
    ./scan_and_print.nix
    ./trackpoint.nix
    ./gpu.nix
  ];
}
