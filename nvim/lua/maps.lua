local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("i", "jj", "<ESC>")

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- New tab
keymap.set("n", "ss", ":split<cr><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<cr><C-w>w", { silent = true })

keymap.set("n", "te", ":tabedit<cr>", { silent = true })
keymap.set("n", "tn", "gt")
keymap.set("n", "tp", "gT")

-- term
keymap.set("t", "<C-^>", "<C-\\><C-n>")

-- neo-tree
vim.keymap.set("n", "<leader>,f", "<cmd>Neotree source=filesystem toggle<cr>")
vim.keymap.set("n", "<leader>,g", "<cmd>Neotree source=git_status toggle<cr>")

--telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { silent = true })
