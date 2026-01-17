{inputs, ...}: {
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  flake.overlays.modifications = final: prev: {
    example = prev.example.overrideAttrs (oldAttrs:
      rec {
        #...
      });
  };
}

