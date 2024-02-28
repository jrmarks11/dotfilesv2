local M = {}

function M.paste()
  vim.api.nvim_set_option('paste', true)
  vim.api.nvim_exec('normal! o', false)
  vim.api.nvim_exec('normal! ]p', false)
  vim.api.nvim_set_option('paste', false)
end

return M
