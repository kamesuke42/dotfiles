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
