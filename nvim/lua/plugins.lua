vim.cmd('packadd vim-jetpack')

require('jetpack').startup(function(use)
  use { 'tani/vim-jetpack', opt = 1 }
  use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'RRethy/nvim-base16' }
  use { 'neovim/nvim-lspconfig' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lualine/lualine.nvim' }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use { 'junegunn/fzf', run = 'call fzf#install()' }
  use { 'junegunn/fzf.vim' }
  use 'cohama/lexima.vim'
  use 'nvim-lua/plenary.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'tpope/fugitive.vim'
  use 'machakann/vim-sandwich'
  use 'ray-x/lsp_signature.nivm'
  use 'folke/trouble.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'TimUntersberger/neogit'
  use 'phaazon/hop.nvim'
end)
