set number
syntax enable
filetype plugin indent on
set cursorline
set incsearch
set hlsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set expandtab
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

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.go setlocal tabstop=8 shiftwidth=8 noexpandtab
	autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 shiftwidth=2
augroup END
