set expandtab
" set tabstop=4
" set shiftwidth=4

syntax on          " Enable syntax highlighting 
filetype indent on " Enable indenting for files
set backspace=indent,eol,start " Allow backspacing over indentation
set nocompatible   " Use VIM settings rather than Vi settings
set softtabstop=2  " Indent by 2 spaces when hitting tab
set shiftwidth=2   " Indent by 4 spaces when auto-indenting
set tabstop=2      " Show existing tab with 4 spaces width
set autoindent     " Enable auto indenting
set number         " Enable line numbers
set nobackup       " Disable backup
set laststatus=2   " Show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)”
set wildmenu       " Display command line's tab complete options as a menu
set directory=$HOME/.vim/swp// " Store swp files in its own folder
set undodir=$HOME/.vim/undodir " Store undo files in its own folder
set showcmd       " Show cmd in bottom right screen
set cursorline    " Highlight text of cursor
" set lazyredraw
" set showmatch
set incsearch     " Find next search as you type
set hlsearch      " Highlight searches

" Set screen width and textwrap
highlight ColorColumn ctermbg=gray
set colorcolumn=80
autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=80  wrapmargin=80 linebreak
autocmd FileType * set formatoptions=croqtn
" autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=0 wrapmargin=0 wrap linebreak
" autocmd BufRead, BufEnter, BufNewFile * IndentLinesReset

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mindriot101/vim-yapf'
Plug 'w0rp/ale'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'sainnhe/vim-color-forest-night'
Plug 'sainnhe/gruvbox-material'
Plug 'neovimhaskell/haskell-vim'

call plug#end()

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
let g:gruvbox_contrast_dark='dark'
let g:gruvbox_material_background = 'soft'
set background=dark
colorscheme gruvbox-material

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
let NERDTreeQuitOnOpen=1
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

" Haskell Vim settings
let g:haskell_indent_disable = 1

" Map leader
let mapleader = "\<Space>"

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

" Visual bindings
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" miscellaneous bindings
nnoremap <leader>f :call Yapf()<CR>
nnoremap <leader><leader> :nohlsearch<CR>
nnoremap <S-j> <Nop>
nnoremap <S-j> :<Up>
