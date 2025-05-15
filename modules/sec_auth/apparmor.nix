{pkgs, ...}: {
  security.apparmor.enable = true;

  # XDG-USER-DIR package and config
  environment.systemPackages = with pkgs; [
    apparmor-pam
    apparmor-parser
    apparmor-profiles
    apparmor-utils
    roddhjav-apparmor-rules
  ];
}
