local M = {}

function M.all_files()
  local cwd = vim.fn.getcwd()
  local oldfiles = vim.v.oldfiles

  local files_in_cwd = vim.tbl_filter(function(file)
    return vim.fn.fnamemodify(file, ':p:h'):find(cwd) ~= nil
  end, oldfiles)

  return files_in_cwd
end

function M.last_buffer()
  local sorted = M.all_files()
  print(sorted)

  if #sorted > 0 then
    vim.cmd('e ' .. sorted[1])
  else
    vim.cmd('e .')
  end
end

return M
