local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	ensure_installed = {
		"c",
		"commonlisp",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"llvm",
		"lua",
		"markdown",
		"php",
		"python",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
		"zig",
	},
	auto_install = true,
})
