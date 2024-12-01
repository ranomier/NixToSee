{pkgs, ...}: {
  security.apparmor.enable = true;

  # XDG-USER-DIR package and config
  environment.systemPackages = with pkgs; [
    apparmor-pam
    apparmor-utils
    apparmor-parser
    apparmor-profiles
    roddhjav-apparmor-rules
  ];
}
