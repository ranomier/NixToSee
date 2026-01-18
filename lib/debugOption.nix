{lib, ...}: {
  /*
  use with:
    config.debug = insert_aynthing;

  example:
    config.debug = config.networking.hostName;

  *
  */
  options.debug = lib.mkOption {
    type = lib.types.raw;
    default = "empty, for some reason ...";
    visible = false;
    internal = true;
    description = ''
      use with:
        config.debug = insert_aynthing;

      example:
        config.debug = config.networking.hostName;
    '';
  };
}
