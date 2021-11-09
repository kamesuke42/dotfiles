set number
set relativenumber
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

set colorcolumn=80
highlight ColorColumn ctermbg=5 guibg=lightgrey


inoremap jj <ESC>

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" linterで警告、エラーが発生している行にカーソルを当てると
" 詳細を表示
let g:lsp_diagnostics_echo_cursor=1
let g:airline_theme='simple'
