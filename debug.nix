{ ... }:
{
  imports = [
    {lib, config, ... }: {
      options.tempDebugVar = lib.mkOption {
        type = lib.types.str;
        default = "";
        description = "tempDebugVar";
      };
    }
  ];

  environment.etc."debugfile".text = ''
    ${config.tempDebugVar}
  '';
}
