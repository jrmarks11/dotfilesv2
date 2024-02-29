local M = {}

function M.all_files()
  local cwd = vim.fn.getcwd() .. '/'
  local oldfiles = vim.v.oldfiles

  local files_in_cwd = {}
  for _, file in ipairs(oldfiles) do
    if vim.startswith(file, cwd) then
      local relative_path = file:sub(#cwd + 1)
      table.insert(files_in_cwd, relative_path)
    end
  end

  return files_in_cwd
end

function M.last_buffer()
  local sorted = M.all_files()

  if #sorted > 0 then
    vim.cmd('e ' .. sorted[1])
  else
    vim.cmd('e .')
  end
end

return M
