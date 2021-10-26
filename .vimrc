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

set background=dark
colorscheme hybrid

inoremap jj <ESC>

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'w0ng/vim-hybrid'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" linterで警告、エラーが発生している行にカーソルを当てると
" 詳細を表示
let g:lsp_diagnostics_echo_cursor=1
