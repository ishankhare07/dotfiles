set nocompatible                " be iMproved, required
filetype plugin indent on       " required

" set syntax highlighting on
syntax on

" set line number on
set number

" turn off line wraping
set nowrap

" enable backspace in vim on mac
set backspace=indent,eol,start

" set options for youcompleteme whitlist files
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1, 'python': 1, 'go': 1, 'erlang': 1}

" auto-close ycm preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    " \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set formatprg=autopep8\ -|

au BufNewFile,BufRead *.js,*.html,*.css,*.yml,*.yaml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |

au BufNewFile,BufRead *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set noexpandtab |
    \ set autoindent |
    \ set smarttab

" go tab settings
"autocmd Filetype *.go set tabstop=4 softtabstop=0 shiftwidth=4 noexpandtab

" allow shortcut for split resizing
nnoremap <c-w>> :vertical resize +10<cr>
nnoremap <c-w>< :vertical resize -10<cr>

" set vim-airline to always appear
set laststatus=2

" vim airline - tabline
let g:airline#extensions#tabline#enabled = 1

" intergate vim-airline with powerline fonts
let g:airline_powerline_fonts = 1

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
Plugin 'scwood/vim-hybrid'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'

Plugin 'altercation/vim-colors-solarized'

" typescript highlighting
Plugin 'clausreinke/typescript-tools.vim'
Plugin 'leafgarland/typescript-vim'

" Non-themes
" Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'

Plugin 'w0rp/ale'
Plugin 'luochen1990/rainbow'

Plugin 'vimwiki/vimwiki'
Plugin 'kien/ctrlp.vim'

" vim-go
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'sebdah/vim-delve'
" Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" elrang specific
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'

Plugin 'elixir-lang/vim-elixir'

" nerdtree specific configuration
Plugin 'scrooloose/nerdtree'

" clojure specific
Plugin 'tpope/vim-fireplace'
Plugin 'venantius/vim-cljfmt'

" graphviz
Plugin 'liuchengxu/graphviz.vim'

" rainbow parens
Plugin 'junegunn/rainbow_parentheses.vim'

Plugin 'davidhalter/jedi-vim'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle binding for nerdtree
map <C-f> :NERDTreeToggle<CR>

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
let g:airline_theme='base16_solarized'

" detect ctrl arrow keys inside tmux
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

set encoding=utf-8

" CtrlP binding
let g:ctrlp_map = '<C-l>'


" let g:go_fmt_fail_silently = 0
let g:go_auto_sameids = 1
let g:go_list_type = "locationlist"
let g:ale_open_list = 1

" Tab navigation like Firefox.
nnoremap <C-p> :bprevious<CR>
map <C-p> :bprevious<CR>
imap <C-p> <Esc>:bprevious<CR>
map <C-n>   :bnext<CR>
imap <C-n>    <Esc>:bnext<CR>
nnoremap <C-t>     :enew<CR>
imap <C-t>  <Esc>:enew<CR>
map <C-q>       :bdelete<CR>
imap <C-q>       :bdelete<CR>
nnoremap <C-q>     :bdelete<CR>
inoremap <C-q>     <Esc>:bdelete<CR>

" remap ; to : when in normal mode
" nnoremap ; :

" ycm autocomplete
set omnifunc=youcompleteme#Complete
set completefunc=youcompleteme#Complete
