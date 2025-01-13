{ ... }:{
  system.userActivationScripts.zshrc = "touch .zshrc";

  programs.zsh = {
    enable = true;
    shellInit = ''
      compinit () {
        builtin autoload -XUz /run/current-system/sw/share/zsh/$ZSH_VERSION/functions
      }
      # config options to make zsh obey XDG base directory standard
      ZDOTDIR=$HOME/.config/zsh
      [ -d "$HOME"/.config/zsh ] || mkdir -p "$HOME"/.config/zsh
      HISTFILE="$XDG_STATE_HOME"/zsh/history
      # Completion files: Use XDG dirs
      [ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
      compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

      # Note that to manually override this in ~/.zshrc you should run `prompt off`
      # before setting your PS1 and etc. Otherwise this will likely to interact with
      # your ~/.zshrc configuration in unexpected ways as the default prompt sets
      # a lot of different prompt variables.
      autoload -U promptinit && promptinit && prompt suse && setopt prompt_sp

      HISTFILE=~/.histfile
      HISTSIZE=1000
      SAVEHIST=1000

      # bindkey
      bindkey -e

      bindkey "\e[3~" delete-char
      # Home- und End-Keys.
      bindkey '\e[1~' beginning-of-line
      bindkey '\e[4~' end-of-line

      # to redo the initial zsh installation run these commands
      #autoload -Uz zsh-newuser-install
      #zsh-newuser-install -f
    '';

    ohMyZsh.enable = true;
  };
}
