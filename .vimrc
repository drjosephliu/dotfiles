filetype plugin indent on
syntax on

set backspace=indent,eol,start

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showtabline=4

set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
Plug 'mindriot101/vim-yapf'
Plug 'w0rp/ale'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

highlight ColorColumn ctermbg=gray
set colorcolumn=80
autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=79 wrapmargin=79 linebreak
" autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=0 wrapmargin=0 wrap linebreak
autocmd BufRead, BufEnter, BufNewFile * IndentLinesReset
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'javascript': ['prettier-eslint', 'eslint'],
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1

set t_Co=256
set term=xterm-256color
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox
set background=dark

map <C-x> :NERDTreeToggle<CR>
noremap <TAB> <C-W>w
noremap <S-TAB> <C-W>h

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" autoclose matching quotes, braces and parentheses
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap jj  <Esc>
inoremap <Esc> <Nop>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <C-y> <C-o>h
inoremap <C-u> <C-o>l
nnoremap <leader>f :call Yapf()<CR>
map <leader>p :set paste<CR>i<esc>"*]p:set nopaste<CR>
nnoremap <leader><space> :nohlsearch<CR>
