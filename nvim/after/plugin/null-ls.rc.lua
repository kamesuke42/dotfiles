local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.black,
		formatting.prettier.with({
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "html", "json" },
		}),
		formatting.stylua,
		formatting.yamlfmt,
		formatting.phpcsfixer,
		diagnostics.eslint_d,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
