{ pkgs, ... }:
let
  default_command = "Hyprland";
in
{
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      initial_session = {
        command = default_command;
        user = "ranomier";
      };
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
            --time \
            --time-format '%Y-%m-%dT%H:%M:%S %A' \
            --remember \
            --user-menu \
            --user-menu-min-uid 1000 \
            --user-menu-max-uid 2000 \
            --theme 'border=lightgreen;text=lightgreen;prompt=lightgreen;time=lightgreen;action=lightgreen;button=lightgreen;input=lightgreen' \
            --cmd ${default_command}
        '';
        user = "greeter";
      };
    };
  };
}
