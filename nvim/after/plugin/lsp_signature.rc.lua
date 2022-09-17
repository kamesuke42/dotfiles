local status, signature = pcall(require, 'lsp_signature')
if (not status) then return end

signature.setup({
  bind = true,
  handler_opts = {
    border = 'rounded'
  }
})
