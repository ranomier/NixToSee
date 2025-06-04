# TODO refine firejail it seems that / is not shielded enough and app armor does not work
{pkgs, ...}: {
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      nuclear = {
        executable = "${pkgs.nuclear}/bin/nuclear";
        profile = "${pkgs.firejail}/etc/firejail/nuclear.profile";
        extraArgs = [
          # Enforce dark mode
          "--env=GTK_THEME=Adwaita:dark"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
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

      librewolf = {
        executable = "${pkgs.librewolf}/bin/librewolf";
        profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
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

      nyxt = {
        executable = "${pkgs.nyxt}/bin/nyxt";
        profile = "${pkgs.firejail}/etc/firejail/chromium-browser.profile";
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
