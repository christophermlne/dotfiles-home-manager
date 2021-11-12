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
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "minimal";
      };
      prezto = {
        enable = true;
        editor.keymap = "vi";
        prompt.theme = "skwp";
      };
      profileExtra = ''
        set -o vi
        export EDITOR=vim
        export VISUAL=vim
        . ~/.nix-profile/etc/profile.d/nix.sh
      '';

      shellAliases = {
        vi = "vim";
	      gs = "git status";
     	  gco = "git checkout";
      };
    };
  };
}
