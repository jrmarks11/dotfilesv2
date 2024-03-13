local M = {}

function M.open()
  local fn = vim.fn
  local url = fn.expand('<cfile>')
  local escaped_url = fn.shellescape(url, 1)
  local command = 'open ' .. escaped_url
  fn.system(command)
end

return M
