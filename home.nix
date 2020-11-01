{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christopher";
  home.homeDirectory = "/home/christopher";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = [
    pkgs.tree
    pkgs.ctags
    pkgs.zsh
    pkgs.tmux
  ];

  programs.git = {
    enable = true;
    userName = "Christopher Milne";
    userEmail = "christopher.milne@gmail.com";
  };

  programs.neovim = {
    enable = true;
    extraConfig = "colorscheme zellner";
    vimAlias = true;
  };

  home.file.".tmux.conf".source = ./tmux.conf;
}
