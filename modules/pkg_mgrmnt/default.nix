{
  imports = [
    ./flatpak.nix
    ./garbage-collect.nix
    ./podman.nix

    #./store_pkg_file.nix
    # error: expected a set but found a string with context: "/nix/store/iswr3420gi06j25xb7qarhcq1mkzc98b-podman-docker-compat-5.7.0"
    # … while calling anonymous lambda
    #   at /nix/store/kvz5wrh6phyjw84n7mvn24sijvwq5w7z-source/modules/pkg_mgrmnt/store_pkg_file.nix:8:30:
    #      7|   environment.etc."current-system-packages".text = let
    #      8|     packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    #       |                              ^
    #      9|     sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);

    # … while selecting an attribute
    #   at /nix/store/kvz5wrh6phyjw84n7mvn24sijvwq5w7z-source/modules/pkg_mgrmnt/store_pkg_file.nix:8:36:
    #      7|   environment.etc."current-system-packages".text = let
    #      8|     packages = builtins.map (p: "${p.name}") config.environment.systemPackages;
    #       |                                    ^
    #      9|     sortedUnique = builtins.sort builtins.lessThan (pkgs.lib.lists.unique packages);
  ];
}
