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
Plug 'kien/ctrlp.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'mindriot101/vim-yapf'
Plug 'w0rp/ale'
Plug 'alvan/vim-closetag'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

" Set screen width and textwrap
highlight ColorColumn ctermbg=gray
set colorcolumn=121
autocmd BufNewFile,BufRead * setlocal formatoptions=croqtn textwidth=120  wrapmargin=120 linebreak
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
map <C-x> :NERDTreeToggle<CR>
noremap <TAB> <C-W>w
noremap <S-TAB> <C-W>h
autocmd BufEnter * lcd %:p:h

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 0 
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'min:4,max:30'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$\|node_modules',
\ 'file': '\.exe$\|\.so$\|\.dat$'
\ }
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("j")': ['<S-j>', '<Down>'],
    \ 'PrtSelectMove("k")': ['<S-k>', '<Up>'],
    \ }

" Silver searcher settings
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Ligthtning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag 5s -l --nocolor -g ""'

    " ag is fast enough that Ctrl doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
" nnoremap K :grep! "\b<C-r><C-w>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <S-k> :Ag<Space>

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
