{ pkgs, ... }:
let
  custom-mpv = pkgs.mpv.override {
    scripts = with pkgs.mpvScripts; [
      # new osc
      modernz
      thumbfast # optional depencency

      mpris
      mpv-notify-send

      quality-menu
      reload
      sponsorblock
      youtube-chat

    ];
  };
in {
  environment.systemPackages = [ custom-mpv ];
}
# https://github.com/akiirui/mpv-handler 
# needed? it kinda already works

# https://github.com/Lassulus/wrappers/tree/main?tab=readme-ov-file#overview
# maybe use this

# https://github.com/po5/thumbfast
# create config for this

# https://github.com/Samillion/ModernZ/blob/main/modernz.conf
# use this config
