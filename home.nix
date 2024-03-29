{ config, pkgs, ... }:

{
  imports = [
    ./config/shell/zsh.nix
    ./config/neovim/neovim.nix
  ];

  programs.home-manager.enable = true;
  home.username = "christopher";

  # how to make this OS-independent?
  home.homeDirectory = "/Users/christophermilne";

  # The Home Manager release that your configuration is compatible with
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = [
    pkgs.htop
    pkgs.nodejs
    pkgs.tig
    pkgs.tree
    pkgs.zsh
    pkgs.tmux
    pkgs.fzf
    pkgs.yarn
    pkgs.youtube-dl
    pkgs.ffmpeg
    pkgs.bundler
    pkgs.solargraph
    pkgs.jq
    pkgs.universal-ctags
    pkgs.ripgrep
  ];

  programs.git = {
    enable = true;
    userName = "Christopher Milne";
    userEmail = "christopher.milne@gmail.com";
  };

  neovim = { enable = true; };
  shell = { zsh = { enable = true; }; };

  home.file.".tmux.conf".source = ./config/tmux.conf;

  home.file.".gitconfig".source = ./config/git/gitconfig;
  home.file.".inputrc".source = ./config/vimify/inputrc;
  home.file.".editrc".source = ./config/vimify/editrc;
}
