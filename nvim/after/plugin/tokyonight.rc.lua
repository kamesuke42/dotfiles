local status, tokyonight = pcall(require, "tokyonight")
if not status then
	return
end

tokyonight.setup({
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})

vim.cmd([[colorscheme tokyonight-night]])
