local M = {}

function M.rename_file()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name, 'file')
  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    os.remove(old_name)
    vim.cmd('redraw!')
  end
end

return M
