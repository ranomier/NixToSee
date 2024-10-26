{pkgs, ...}: {
  # Also enable non-free packages or else the factorio download will fail:
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    factorio-headless
  ];

  services.factorio = {
    enable = true;
    openFirewall = true;
    #mods =
    #  let
    #    inherit (pkgs) lib;
    #    modDir = /opt/factorio-mods;
    #    modList = lib.pipe modDir [
    #      builtins.readDir
    #      (lib.filterAttrs (k: v: v == "regular"))
    #      (lib.mapAttrsToList (k: v: k))
    #      (builtins.filter (lib.hasSuffix ".zip"))
    #    ];
    #    modToDrv = modFileName:
    #      pkgs.runCommand "copy-factorio-mods" {} ''
    #        mkdir $out
    #        cp ${modDir + "/${modFileName}"} $out/${modFileName}
    #      ''
    #      // { deps = []; };
    #  in
    #    builtins.map modToDrv modList;
  };
}
