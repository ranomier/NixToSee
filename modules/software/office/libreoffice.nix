{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libreoffice
    hunspell
    hunspellDicts.en_GB-large
    hunspellDicts.de_DE
  ];
}
