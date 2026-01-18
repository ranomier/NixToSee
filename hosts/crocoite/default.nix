{inputs, ...}: {
  nixpkgs = {
    # You can add overlays here
    overlays = with inputs.self.overlays; [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      unstable-packages

      #additions
      #modifications

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./boot.nix

    ../../system_profiles/desktop.nix
    # ../../experiments

    ./39c3-wifi.nix # temp
  ];
}
