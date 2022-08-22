local keymap = vim.keymap
vim.g.mapleader = ' '

keymap.set('i', 'jj', '<ESC>')

-- Increment / Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- New tab
keymap.set('n', 'ss', ':split<cr><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<cr><C-w>w', { silent = true })

keymap.set('n', 'te', ':tabedit<cr>', { silent = true })
keymap.set('n', 'tn', 'gt')
keymap.set('n', 'tp', 'gT')
