set number
set relativenumber

inoremap jj <ESC>

" ==========dein==========
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kamesuke42/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/kamesuke42/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/home/kamesuke42/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('neoclide/coc.nvim', {'rev': 'release'})
call dein#add('junegunn/fzf', {'merged': 0})
call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
call dein#add('tpope/vim-fugitive')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" =====vim-airline-themes=====
let g:airline_theme="murmur"

" =====coc.nvim=====
let g:coc_global_extensions = [
      \ 'coc-deno',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-go',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-toml',
      \ 'coc-vimlsp',
      \ 'coc-yaml'
      \ ]

call coc#config('coc.preferences.formatOnType', 'true')
call coc#config('codeLens.enable', v:true)
call coc#config('languageserver', {
      \ 'clojure-lsp': {
        \ 'command': 'bash',
        \ 'args': ['-c', 'clojure-lsp'],
        \ 'filetypes': ['clojure'],
        \ 'rootPatterns': ['project.clj'],
        \ 'additionalSchemes': ['jar', 'zipfile'],
        \ 'trace.server': 'verbose',
        \ 'initializationOptions': {
          \ }
        \ }
        \ })

" options
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp.sjis
set fileformats=unix,dos,mac
set belloff=all
set smartindent autoindent
set incsearch
set ignorecase
set hlsearch
set undolevels=1000
set scrolloff=100
set cursorline
set noswapfile
set laststatus=2
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

set tabstop=2 shiftwidth=2 softtabstop=2

augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType zsh setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType markdown setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
