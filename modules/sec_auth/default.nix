{...}: {
  imports = [
    ./apparmor.nix
    ./firejail.nix
    ./login-manager.nix
    ./ssh.nix
  ];
}
