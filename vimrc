" Install the plugin manager - if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

let mapleader = " "

set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set smartindent
set nowrap
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'  " bottom status bar

call plug#end()

set background=dark             " Setting dark mode
colorscheme gruvbox

" Find file (vscode shortcut)
nnoremap <C-p> :Files<CR>
