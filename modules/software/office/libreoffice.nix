{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libreoffice
    hunspell
    hunspellDicts.en_UK
    hunspellDicts.de_DE
  ];
}
