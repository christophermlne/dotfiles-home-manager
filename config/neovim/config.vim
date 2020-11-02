set nocompatible

"Standard vimrc stuff

"-------------------------

filetype plugin indent on

set backspace=indent,eol,start
set dir=~/.vim/.swp//
set encoding=utf-8
set expandtab
set exrc
set history=50
set hlsearch
set incsearch
set laststatus=2

set nocompatible

set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set autoindent
set nocindent
set smartindent
set softtabstop=2

set t_Co=256

set ts=2

set lazyredraw
set ttyfast

syntax enable

"Get rid of annoyances

set noswapfile
set nobackup
set nowritebackup

"Convenience

"-------------------------

"Make ";" synonymous with ":" to enter commands

nmap ; :

"call plug#begin('~/.vim/plugged')
"  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"call plug#end()
