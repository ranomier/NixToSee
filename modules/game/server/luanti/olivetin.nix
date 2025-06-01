{ pkgs, ... }: {
  services.olivetin = {
    enable = true;
    settings = {
      actions = [
        {
          title = "Hello world!";
          shell = "echo 'Hello World!'";
          popupOnStart = "execution-dialog-stdout-only";
        }
      ];
    };

    path = with pkgs; [
      bash
      git
    ];
  };
}
