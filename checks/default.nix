inArgs: {
  "x86_64-linux"."lock-check" = let
    pkgs = inArgs.nixpkgs.legacyPackages."x86_64-linux";
  in derivation {
    name = "lock-check";
    system = "x86_64-linux";
    builder = "${pkgs.busybox}/bin/busybox";
    args = [
      "sh" "-c"
      ''
        export PATH=${pkgs.busybox}/bin:$PATH

        mkdir -p "$out"
        "${pkgs.flake-checker}/bin/flake-checker" \
          --no-telemetry \
          "${inArgs.self + /flake.lock}" \

            2>&1 | tee "$out/output"
      ''
    ];

  };
}
