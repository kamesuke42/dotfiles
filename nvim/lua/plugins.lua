vim.cmd("packadd vim-jetpack")

require("jetpack.packer").startup(function(use)
	use({ "tani/vim-jetpack", opt = 1 })

	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")

	use({ "RRethy/nvim-base16" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim" })
	use("cohama/lexima.vim")
	use("tpope/vim-fugitive")
	use("machakann/vim-sandwich")
	use("lewis6991/gitsigns.nvim")
	use("TimUntersberger/neogit")
	use("phaazon/hop.nvim")
	use("nvim-neo-tree/neo-tree.nvim")

	-- fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	use("ray-x/lsp_signature.nvim")
	use("folke/trouble.nvim")

	-- formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		branch = "main",
		opt = true,
		run = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	use("windwp/nvim-autopairs")

	use("folke/tokyonight.nvim")
end)
