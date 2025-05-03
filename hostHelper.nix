inArgs: hostname: #{
  #${hostname} = inArgs.nixpkgs.lib.nixosSystem {
  inArgs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inArgs;};
    modules = [
      {networking.hostName = hostname;}
      (./hosts/${hostname})
    ];
  }
