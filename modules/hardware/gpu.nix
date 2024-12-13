{ pkgs, ... }:{
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    libvdpau-va-gl
  ];
}
