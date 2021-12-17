" dein.vim {{{
let s:DEIN_BASE_PATH = $HOME . '.cache/dein/'
let s:DEIN_PATH      = expand(s:DEIN_BASE_PATH . 'repos/github.com/Shougo/dein.vim')

if &compatible
  set nocompatible
endif

set runtimepath+={HOME}/.cache/dein/repos/github.com/Shougo/dein.vim
set runtimepath+={HOME}/code/denops

call dein#begin('{HOME}/.cache/dein')

call dein#add('{HOME}/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('neoclide/coc.nvim', {'rev': 'release'})
call dein#add('junegunn/fzf', {'merged': 0})
call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
call dein#add('tpope/vim-fugitive')
call dein#add('easymotion/vim-easymotion')
call dein#add('machakann/vim-sandwich')
call dein#add('ulwlu/elly.vim')

if has('nvim')
  call dein#add('nvim-treesitter/nvim-treesitter')
endif

call dein#end()

if dein#check_install()
  call dein#install()
endif
" }}}

" general {{{
let mapleader = "\<space>"
noremap <Leader> <Nop>
noremap <dev> <Nop>
map m <dev>
inoremap jj <ESC>
nmap <leader>br :bro ol<CR>
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=2000
set redrawtime=1500
set shortmess+=c
set number
set relativenumber
set mouse=nvci
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
set termguicolors
set list listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set tabstop=2 shiftwidth=2 softtabstop=2
syntax enable
colorscheme elly
" }}}

" auto-pairs {{{
let g:AutoPairsShortcutFastWrap = '<C-e>'
" }}}

" vim-airline {{{
let g:airline_theme="elly"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" }}}

" vim-gitgutter {{{
nmap ghp <Plug>(GitGutterPreviewHunk)
" }}}

" coc.nvim {{{
let g:coc_global_extensions = [
      \ 'coc-deno',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-clangd',
      \ 'coc-go',
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-pyright',
      \ 'coc-rust-analyzer',
      \ 'coc-toml',
      \ 'coc-vimlsp',
      \ 'coc-yaml',
      \ ]

call coc#config('coc.preferences.formatOnType', 'true')
call coc#config('prettier.blacketSpacing', 'true')
call coc#config('eslint.autoFixOnSave', 'true')
call coc#config('eslint.autoFix', 'true')
call coc#config('tsserver.enableJavascript', 'false')
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

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)
nmap <leader>rn <Plug>(coc-rename)
" }}}


augroup fileTypeIndent
  au!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType clojure setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescriptreact setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType zsh setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType markdown setlocal tabstop=2 shiftwidth=2 expandtab
augroup END
