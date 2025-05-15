{
  pkgs,
  config,
  ...
}: {
  # The virtual camera requires the v4l2loopback kernel module to be installed, a loopback device configured, and polkit enabled so OBS can access the virtual device.
  security.polkit.enable = true;

  environment.systemPackages = [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];

  boot = {
    kernelModules = ["v4l2loopback"];

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
