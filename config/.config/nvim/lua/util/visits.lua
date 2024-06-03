local M = {}

function M.toggle_marked()
  local visits = require 'mini.visits'

  local path = vim.fn.expand '%:p'
  local cwd = vim.fn.getcwd()

  local labels = visits.list_labels(path, cwd)

  if labels and vim.tbl_contains(labels, 'marked') then
    visits.remove_label('marked', path, cwd)
  else
    visits.add_label('marked', path, cwd)
  end
end

return M
