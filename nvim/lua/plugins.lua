vim.cmd('packadd vim-jetpack')

require('jetpack').startup(function(use)
  use { 'tani/vim-jetpack', opt = 1 }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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
end)
