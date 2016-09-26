set nocompatible              " be iMproved, required
filetype off                  " required

" set syntax highlighting on
syntax on

" set line number on
set number

" enable backspace in vim on mac
set backspace=indent,eol,start

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

" vim airline - tabline
let g:airline#extensions#tabline#enabled = 1

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

" Themes
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'lyxell/pride.vim'
Plugin 'mhumeSF/one-dark.vim'
Plugin 'scwood/vim-hybrid'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'

" Non-themes
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
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

" set dark background
set background=dark

" set colorscheme
colorscheme solarized

" If you don't want airline colors in tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" setting default theme for airline
let g:airline_theme='solarized'

" detect ctrl arrow keys inside tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set encoding=utf-8

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
map <M-tab>   :tabnext<CR>
imap <M-tab>    <Esc>:tabnext<CR>
map <C-q>       :tabclose<CR>
nnoremap <C-Left>   :tabprevious<CR>
nnoremap <C-t>     :tabnew<CR>
imap <C-t>  :tabnew<CR>
nnoremap <M-q>     :tabclose<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <M-q>     <Esc>:tabclose<CR>
