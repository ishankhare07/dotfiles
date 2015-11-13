set nocompatible              " be iMproved, required
filetype off                  " required

" set syntax highlighting on
syntax on

" set line number on
set number

" set options for youcompleteme whitlist files
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1, 'python': 1}

" auto-close ycm preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

" set tab width to 4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" allow shortcut for split resizing
nnoremap <c-w>> :vertical resize +10<cr>

" set vim-airline to always appear
set laststatus=2

" intergate vim-airline with powerline fonts
let g:airline_powerline_fonts = 1

" always use spaces instead of tabs
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'altercation/vim-colors-solarized'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'lyxell/pride.vim'
Plugin 'MPiccinato/wombat256'
Plugin 'rust-lang/rust.vim'
Plugin 'freeo/vim-kalisi'
Plugin 'mhumeSF/one-dark.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Valloric/YouCompleteMe'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" first set 256 color support
set t_Co=256

" setting default theme for airline
let g:airlinetheme='hybrid'

" enable colorscheme
colorscheme onedark
" set dark background
set background=dark

" If you don't want airline colors in tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" detect ctrl arrow keys inside tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

