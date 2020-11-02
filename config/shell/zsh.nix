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

      shellAliases = {
        vi = "vim";
	gs = "git status";
	gco = "git checkout";
      };
    };
  };
}
