local M = {}

function M.paste()
  local opt = vim.opt
  local cmd = vim.cmd

  local original_paste = opt.paste
  local original_expandtab = opt.expandtab

  opt.paste = true
  opt.expandtab = true

  cmd 'normal! o'
  cmd 'normal! ]p'

  opt.paste = original_paste
  opt.expandtab = original_expandtab

  cmd 'normal! `[V`]='
end

return M
