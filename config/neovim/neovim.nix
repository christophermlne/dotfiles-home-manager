{ config, pkgs, lib, ... }:

with lib;
let cfg = config.neovim;

in {
  options = {
    neovim.enable = mkEnableOption "enable neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      vimAlias = true;
      extraConfig =
        builtins.readFile ./config.vim +
        builtins.readFile ./settings/nerdtree.vim +
        builtins.readFile ./settings/solarized.vim +
        builtins.readFile ./settings/ctrlp.vim +
        builtins.readFile ./settings/appearance.vim +
        builtins.readFile ./settings/keymap.vim +
        builtins.readFile ./settings/lightline.vim +
        builtins.readFile ./settings/vim-coc.vim;

      plugins =
        with pkgs.vimPlugins; [
          nerdtree
          fugitive
          ctrlp
          tcomment_vim
          coc-nvim
          coc-pyright
          coc-solargraph
          coc-tsserver
          coc-eslint
          vim-nix
          vim-elixir
        ];
      };

      home.file.".vim/settings/solarized.vim".source = ./settings/solarized.vim;
      home.file.".config/nvim/autoload/plug.vim".source = ./plug.vim;
      home.file.".config/vim/plugged/showmarks.vim".source = ./plugins/showmarks.vim;
  };
}
