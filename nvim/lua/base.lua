vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.scrolloff = 3
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.colorcolumn = { 80, 100 }
vim.opt.wildmenu = true
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- File
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
