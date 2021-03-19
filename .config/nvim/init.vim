let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \    'left': [ [ 'mode', 'paste' ],
    \              [ 'readonly', 'filename', 'modified' ] ]
    \ ,
    \    'right': [ [ 'lineinfo' ],
    \               [ 'percent' ],
    \               [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \    'filename': 'LightlineFilename',
    \ }
\ }
let g:lightline.seperator = {
    \    'left': '', 'right': ''
\}
let g:lightline.subseperator = {
    \    'left': '|', 'right': '|'
\}
function! LightlineFilename()
	return expand('%t') !=# '' ? @% : '[No Name]'
endfunction

" Plugins
call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'morhetz/gruvbox'
    Plug 'cespare/vim-toml'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

autocmd BufReadPost *.rs setlocal filetype=rust

"GENERAL
set hidden
set history=500
filetype plugin indent on
set autoread
set laststatus=2
set noshowmode
au FocusGained,BufEnter * checktime

" UI
set so=18
set number
set wildmenu
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=1

" COLORS
syntax enable
set background=dark
colorscheme gruvbox
set encoding=utf8
set ffs=unix,dos,mac
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" FS
set nobackup
set nowb
set noswapfile

" TEXT
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

" MOVEMENT
noremap <SPACE> <Nop>
noremap <Up>    :10winc -<CR>
noremap <Down>  :10winc +<CR>
noremap <Left>  :10winc <<CR>
noremap <Right> :10winc ><CR>

let mapleader = " "

nmap <C-Space> :FZF<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-Y>" : "\<cr>"

noremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >=0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

