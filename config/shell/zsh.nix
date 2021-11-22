{ config, pkgs, lib, ... }:

with lib;
let cfg = config.shell.zsh;

in {
  options = {
    shell.zsh.enable = mkEnableOption "enable zsh";
    shell.zsh.direnv = mkEnableOption "enable zsh direnv";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      # oh-my-zsh = {
      #   enable = true;
      #   plugins = [ "git" ];
      #   # theme = "minimal";
      # };
      prezto = {
        enable = true;
        editor.keymap = "vi";
        prompt.theme = "skwp";
      };
      initExtra = ''
        set -o vi
        export EDITOR=vim
        export VISUAL=vim
        . ~/.nix-profile/etc/profile.d/nix.sh

        function git_info () {
          if [ -n "$(git rev-parse --git-dir 2> /dev/null)" ]; then
            echo "($(git rev-parse --abbrev-ref HEAD))"
          fi
        }
        # FIXME: this is overidden because `skwp prompt git_info` isn't a thing.
        # should just use another definition or copy skwp source and make the following change
        export PS1="%F{135}%n%f@%F{166}%m%f %F{118}%~%f \$(git_info) \$ "
      '';

      shellAliases = {
        vi = "vim";
        gd = "git diff";
        gb = "git branch";
        gs = "git status";
     	  gco = "git checkout";
        fvim = "vim $(fzf)";
      };

      enableSyntaxHighlighting = true;
      enableAutosuggestions = true;
    };
  };
}
