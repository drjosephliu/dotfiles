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
set laststatus=2
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
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'mindriot101/vim-yapf'
Plug 'w0rp/ale'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neovimhaskell/haskell-vim'

call plug#end()

" Set screen width and textwrap
highlight ColorColumn ctermbg=gray
set colorcolumn=80
autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=80  wrapmargin=80 linebreak
" autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=0 wrapmargin=0 wrap linebreak
autocmd BufRead, BufEnter, BufNewFile * IndentLinesReset

" indent line ruler settings
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'

" linter settings
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

" theme and terminal colour scheme settings
set t_Co=256
set term=xterm-256color
let g:gruvbox_contrast_dark='dark'
colorscheme gruvbox
set background=dark

" NERDTree settings
function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction
map <C-x> :call NERDTreeToggleInCurDir()<CR>
noremap <TAB> <C-W>w
noremap <S-TAB> <C-W>h
noremap gr gT

" fzf and ripgrep settings
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit'
    \ }
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <C-p> :ProjectFiles<CR>
command! ProjectRg execute 'cd '.system('git rev-parse --show-toplevel') 'Rg'
nnoremap <S-f> :ProjectRg<CR>

" closing tag settings
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

" autocompletion popup window bindings
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <S-j> pumvisible() ? "\<C-n>" : "<S-j>"
inoremap <expr> <S-k> pumvisible() ? "\<C-n>" : "<S-k>"

" move cursor left/right in insert mode
inoremap <C-y> <C-o>h
inoremap <C-u> <C-o>l

" miscellaneous bindings
nnoremap <leader>f :call Yapf()<CR>
map <leader>p :set paste<CR>i<esc>"*]p:set nopaste<CR>
nnoremap <leader><space> :nohlsearch<CR>
