set number
syntax enable
filetype plugin indent on
set cursorline
set incsearch
set hlsearch
set ignorecase

set colorcolumn=80
highlight ColorColumn ctermbg=5 guibg=lightgrey

inoremap jj <ESC>

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'
call plug#end()
