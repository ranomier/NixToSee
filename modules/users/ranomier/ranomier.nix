{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ranomier = {
    isNormalUser = true;
    description = "Ranomier";
    extraGroups = ["networkmanager" "wheel" "podman"];
    shell = pkgs.zsh;
    useDefaultShell = true;
  };
}
