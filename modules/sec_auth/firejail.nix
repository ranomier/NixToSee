# TODO refine firejail it seems that / is not shielded enough and app armor does not work
{pkgs, ...}: {
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      firefox = {
        executable = "${pkgs.firefox}/bin/firefox";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
        extraArgs = [
          # Required for U2F USB stick
          "--ignore=private-dev"
          # Enforce dark mode
          "--env=GTK_THEME=Adwaita:dark"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
          # For screen sharing
          "--dbus-user.talk=org.freedesktop.portal.*"
        ];
      };

      element-desktop = {
        executable = "${pkgs.element-desktop}/bin/element-desktop";
        profile = "${pkgs.firejail}/etc/firejail/element-desktop.profile";
        extraArgs = [
          # Required for U2F USB stick
          "--ignore=private-dev"
          # Enforce dark mode
          "--env=GTK_THEME=Adwaita:dark"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
          # For screen sharing
          "--dbus-user.talk=org.freedesktop.portal.*"
        ];
      };

      brave = {
        executable = "${pkgs.brave}/bin/brave";
        profile = "${pkgs.firejail}/etc/firejail/brave.profile";
        extraArgs = [
          # Required for U2F USB stick
          "--ignore=private-dev"
          # Enforce dark mode
          "--env=GTK_THEME=Adwaita:dark"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
          # For screen sharing
          "--dbus-user.talk=org.freedesktop.portal.*"
        ];
      };
    };
  };
  environment.etc = {
    "firejail/brave.local".text = ''
      whitelist ''${HOME}/.config/brave
      whitelist ''${HOME}/.local
      whitelist ''${HOME}/Downloads
    '';
  };
}
