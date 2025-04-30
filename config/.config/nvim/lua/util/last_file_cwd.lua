local M = {}

function M.all_files()
  local cwd = vim.fn.getcwd() .. '/'
  local oldfiles = vim.v.oldfiles

  local files_in_cwd = {}
  for _, file in ipairs(oldfiles) do
    if vim.startswith(file, cwd) then
      local relative_path = file:sub(#cwd + 1)
      if not string.match(file, 'dbui') and not string.match(file, 'COMMIT_EDITMSG') then
        table.insert(files_in_cwd, relative_path)
      end
    end
  end

  return files_in_cwd
end

function M.last_buffer()
  local sorted = M.all_files()

  for _, file in ipairs(sorted) do
    if vim.fn.filereadable(file) == 1 then
      vim.cmd('e ' .. file)
      return
    end
  end

  require('mini.files').open()
end

return M
