{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ( mpv.override { scripts = [
      # new osc
      mpvScripts.modernz
      mpvScripts.thumbfast # optional depencency

      mpvScripts.quality-menu
      mpvScripts.sponsorblock
    ]; } )
  ];
}
#{
#  pkgs,
#  home-manager,
#  ...
#}: {
#  home-manager.programs.mpv = {
#    enable = true;
#
#    package = (
#      pkgs.mpv-unwrapped.wrapper {
#        scripts = with pkgs.mpvScripts; [
#          uosc
#          sponsorblock
#        ];
#
#        mpv = pkgs.mpv-unwrapped.override {
#          waylandSupport = true;
#          ffmpeg = pkgs.ffmpeg-full;
#        };
#      }
#    );
#
#    config = {
#      profile = "high-quality";
#      ytdl-format = "bestvideo+bestaudio";
#      cache-default = 4000000;
#    };
#  };
#}
