local status, neo_tree = pcall(require, 'neo-tree')
if (not status) then return end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

neo_tree.setup()
