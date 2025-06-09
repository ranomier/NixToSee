{pkgs, inArgs, ...}: {
  imports = [
    inArgs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
    polarity = "dark";
  };
}
