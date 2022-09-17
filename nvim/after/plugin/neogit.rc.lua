local status, neogit = pcall(require, 'neogit')
if (not status) then return end

neogit.setup()

local keymap = vim.keymap.set

keymap('n', '<leader>g', '<cmd>Neogit<cr>')
