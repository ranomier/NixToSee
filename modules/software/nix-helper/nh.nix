{
  programs.nh = {
    enable = true;

    flake = "/home/ranomier/Projects/NixOS";

    #clean = {
    #  enable = true;
    #  extraArgs = "
    #    --keep-since 4d  # At least keep gcroots and generations in this time range since now
    #    --keep 3         # At least keep this number of generations
    #    --no-gc          # Don't run nix store --gc
    #    --no-gcroots     # Don't clean gcroots
    #    --optimise       # Run nix-store --optimise after gc
    #    --max <MAX>      # Pass --max to nix store gc
    #  ";
    #};

  };
}
