{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ranomier = {
    isNormalUser = true;
    description = "Ranomier";
    extraGroups = [ "networkmanager" "wheel" ];
    #packages = with pkgs; [];
  };

  environment.etc = {
    "xdg/user-dirs.defaults".text = ''
      DESKTOP=Desktop
      DOWNLOAD=Downloads
      TEMPLATES=Documents/Templates
      PUBLICSHARE=Public
      DOCUMENTS=Documents
      MUSIC=Media/Music
      PICTURES=Media/Pictures
      VIDEOS=Media/Videos
    '';
  };
  # This is using a rec (recursive) expression to set and access XDG_BIN_HOME within the expression
  # For more on rec expressions see https://nix.dev/tutorials/first-steps/nix-language#recursive-attribute-set-rec
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/mybin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };

  # XDG-USER-DIR package and config
  environment.systemPackages = with pkgs; [
    xdg-user-dirs

    apparmor-pam
    apparmor-utils
    apparmor-parser
    apparmor-profiles
    roddhjav-apparmor-rules
  ];

  security.apparmor.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
