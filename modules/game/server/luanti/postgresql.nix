{pkgs, ...}: {
  config.services.postgresql = {
    enable = true;

    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';

    ensureDatabases = ["luanti_world"];
    ensureUsers = [
      {
        name = "luanti_world";
        ensureDBOwnership = true;
      }
    ];
  };
}
