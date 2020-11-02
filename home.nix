{ config, pkgs, ... }:

{
  imports = [
    ./config/shell/zsh.nix
  ];

  programs.home-manager.enable = true;
  home.username = "christopher";
  home.homeDirectory = "/home/christopher";

  # The Home Manager release that your configuration is compatible with
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
    vimAlias = true;
    configure = {
      customRC = 
        builtins.readFile ./config/neovim/config.vim; # + builtins.readFile ./config-coc.vim;

      packages.myVimPackage = with pkgs.vimPlugins; {
        # loaded on launch
        start = [ fugitive ];
        # manually loadable by calling `:packadd $plugin-name`
        opt = [ ];
      };
    };
  };

  shell = { zsh = { enable = true; }; };

  home.file.".tmux.conf".source = ./config/tmux.conf;
  # home.file.".vim/.plugged".source = ./config/neovim/plug.vim;
  # home.file.".vimrc".source = ./config/neovim/config.vim;
}
