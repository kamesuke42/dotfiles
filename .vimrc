set number
syntax enable
filetype plugin indent on
set cursorline
set incsearch
set hlsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set statusline=%F%m%h%w\ %<[ENC=%{&fenc!=''?&fenc:&enc}]\ [FMT=%{&ff}]\ [TYPE=%Y]\ %=[CODE=0x%02B]\ [POS=%l/%L(%02v)]
set laststatus=2

set colorcolumn=80
highlight ColorColumn ctermbg=5 guibg=lightgrey

inoremap jj <ESC>

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
call plug#end()
