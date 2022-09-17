local status, hop = pcall(require, 'hop')
if (not status) then return end

hop.setup()

local keymap = vim.keymap.set
keymap('', '<leader>hf', "<cmd>HopChar1<cr>", {})
keymap('n', '<leader>hl', '<cmd>HopLineStart<cr>')
