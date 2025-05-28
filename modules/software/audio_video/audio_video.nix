{pkgs, ...}: {
  # Enable sound with pipewire
  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;

      # If you want to use JACK applications, uncomment this
      jack.enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };

  # only for more system kinda packages not editing and such
  environment.systemPackages = with pkgs; [
    helvum
    pwvucontrol
    lxqt.pavucontrol-qt

    qpwgraph
    easyeffects
    non

    roc-toolkit
  ];
}
