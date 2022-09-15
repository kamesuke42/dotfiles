local status, trouble = pcall(require, 'trouble')
if (not status) then
  return
end

trouble.setup {}

-- keymaps
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>')
