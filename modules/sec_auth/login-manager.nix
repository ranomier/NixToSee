{pkgs, ...}: {
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      default_session = {
        command = ''${pkgs.greetd.tuigreet}/bin/tuigreet \
          	  --time \
          	  --time-format '%Y-%m-%dT%H:%M:%S %A' \
          	  --remember \
          	  --user-menu \
          	  --theme 'border=lightgreen;text=lightgreen;prompt=lightgreen;time=lightgreen;action=lightgreen;button=lightgreen;input=lightgreen' \
          	  --cmd Hyprland'';
        # removed elements from theme: container
        user = "greeter";
      };
    };
  };
}
