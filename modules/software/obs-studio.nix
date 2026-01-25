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
        # capture
        wlrobs # capture on wlroots based wayland compositors
        obs-vkcapture #Vulkan/OpenGL game capture
        obs-pipewire-audio-capture

        # output encoding
        obs-vaapi #hardware acceleration, VAAPI support via GStreamer

        # filter/effects
        obs-gstreamer # encoder and video filter plugin to use GStreamer elements/pipelines (manual code required)

        obs-backgroundremoval # background crop without green screen

        obs-composite-blur
        obs-dvd-screensaver
        obs-retro-effects
        pixel-art
      ];
    })
  ];

  boot = {
    kernelModules = ["v4l2loopback"];

    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
  };
}
