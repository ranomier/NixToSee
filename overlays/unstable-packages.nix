{inputs, ...}: {
  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  flake.overlays.unstable-packages = final: _prev: {
    unstable = import inputs.nixos-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
