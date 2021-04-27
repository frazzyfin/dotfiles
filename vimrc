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
set hidden
set noerrorbells
set autoindent
set nowrap
set smartcase
set incsearch
set hlsearch
set scrolloff=8
set noshowmode

filetype plugin indent on

" ===================================================================
" For some reason 24-bit 'true-color' support isn't enabling properly
" Here's a workaround for versions that support termguicolors
if exists ('+termguicolors')
	set termguicolors     " enable true colors support
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'  " bottom status bar
Plug 'justinmk/vim-sneak'

call plug#end()

set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox


" Find file (vscode shortcut)
nnoremap <C-p> :Files<CR>
