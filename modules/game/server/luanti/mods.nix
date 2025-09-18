{
  pkgs,
  config,
  ...
}: let
  GitMod = curl:
    pkgs.fetchgit rec {
      url = curl;
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
    };
  this-variable-should-exist = GitMod "https://gitlab.com/rubenwardy/accountmgr";
in {
  config.tempDebugVar = break this-variable-should-exist;
}
