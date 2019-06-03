filetype plugin indent on
syntax on

set backspace=indent,eol,start

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showtabline=2

set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch


call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
" Plug 'sheerun/vim-polyglot'

call plug#end()

highlight ColorColumn ctermbg=gray
set colorcolumn=81
autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=80

"if (has("termguicolors"))
"  set termguicolors
"endif

set t_Co=256
set term=xterm-256color
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox
set background=dark

map <C-x> :NERDTreeToggle<CR>
noremap <TAB> <C-W>w  

" autoclose matching quotes, braces and parentheses
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap jj  <Esc>
inoremap <Esc> <Nop>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-y> <C-o>h
inoremap <C-u> <C-o>l
