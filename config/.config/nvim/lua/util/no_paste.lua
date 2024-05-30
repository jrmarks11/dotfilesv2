local M = {}

function M.paste()
  local cmd = vim.cmd

  cmd 'normal! o'
  cmd 'normal! ]p'
  cmd 'normal! `[V`]='
end

return M
