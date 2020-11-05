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
    pkgs.tig
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
        builtins.readFile ./config/neovim/config.vim +
        builtins.readFile ./config/neovim/settings/solarized.vim +
        builtins.readFile ./config/neovim/settings/appearance.vim +
        builtins.readFile ./config/neovim/settings/keymap.vim;

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
  home.file.".vim/colors/solarized.vim".source = ./config/neovim/settings/solarized.vim;
  home.file.".vim/settings/solarized.vim".source = ./config/neovim/settings/solarized.vim;
  home.file.".config/nvim/autoload/plug.vim".source = ./config/neovim/plug.vim;
  home.file.".config/vim/plugged/showmarks.vim".source = ./config/neovim/plugins/showmarks.vim;
}
