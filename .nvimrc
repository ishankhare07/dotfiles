set nocompatible              " be iMproved, required
filetype off                  " required

syntax on
set number

" set tab width to 4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" allow shortcut for split resizing
nnoremap <c-w>> :vertical resize +10<cr>

" always use spaces instead of tabs
set expandtab

" set colors to 256
" set t_Co=256
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'MPiccinato/wombat256'
Plugin 'lyxell/pride.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'freeo/vim-kalisi'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'altercation/vim-colors-solarized'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" set colorscheme
colorscheme pride

""if ( $TERM == "xterm-256color" )
""  set term=screen-256color
""end
