local status, nvim_tree = pcall(require, 'nvim-tree')
if (not status) then return end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup()

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')
