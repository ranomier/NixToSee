{pkgs, ...}: {
  services.pipewire.extraConfig.pipewire."99-input-denoise" = {
    "context.modules" = [
      {
        "name" = "libpipewire-module-filter-chain";

        "args" = {
          "node.description" = "Noise Canceling source";
          "media.name" = "Noise Canceling source";
          "audio.position" = ["FL" "FR"];

          "filter.graph" = {
            "nodes" = [
              {
                "type" = "ladspa";
                "name" = "rnnoise";
                "plugin" = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                # mono can be replaced with stereo for double the performance as cost
                "label" = "noise_suppressor_mono";
                "control" = {
                  # if probability of sound being a voice is lower than this threshold it will be silenced.
                  # In most cases the threshold between 85% - 95% would be fine.
                  # Without the VAD some loud noises may still be a bit audible when there is no voice.
                  "VAD Threshold (%)" = 75.0;
                  # for how long after the last voice detection the output won't be silenced.
                  # This helps when ends of words/sentences are being cut off.
                  "VAD Grace Period (ms)" = 200;
                  # similar to VAD Grace Period (ms) but for starts of words/sentences.
                  # This introduces latency!
                  "Retroactive VAD Grace Period (ms)" = 0;
                };
              }
            ];
          };


          "capture.props" = {
            "node.name" = "effect_input.rnnoise";
            "node.passive" = true;
            "audio.rate" = 48000;

            # Only turns the rnnoise plugin on if an app requires it,
            # from the noice canceling capture
            "filter.smart" = true;
            "filter.smart.name" = "rnnoise";
            "filter.smart.target" = {
              "media.name" = "Noise Canceling source";
            };
          };

          "playback.props" = {
            "node.name" = "effect_output.rnnoise";
            "media.class" = "Audio/Source";
            "audio.rate" = 48000;
          };
        };
      }
    ];
  };
}
