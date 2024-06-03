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

function M.frecency_list()
  local visits = require 'mini.visits'
  local sort_recent = visits.gen_sort.default { recency_weight = 0.5 }
  local recent_files = visits.list_paths('', { sort = sort_recent })

  require('fzf-lua').fzf_exec(recent_files, {
    prompt = 'Recent Files> ',
    previewer = 'builtin',
    actions = {
      ['default'] = function(selected)
        vim.cmd('edit ' .. selected[1])
      end,
    },
  })
end

function M.section_marked_files()
  local visits = require('mini.visits')
  local marked_files = visits.list_paths(vim.fn.getcwd(), { filter = 'marked' })
  local current_file = vim.fn.expand('%:p')
  local result = {}
  local current_file_pos = nil

  for i, file in ipairs(marked_files) do
    if file == current_file then
      current_file_pos = i
      table.insert(result, string.format("[%d]", i))
    else
      table.insert(result, tostring(i))
    end
  end

  local status = table.concat(result, " ")
  if current_file_pos then
    return status, 'MiniStatuslineMarked'
  else
    return status, 'MiniStatuslineUnmarked'
  end
end

return M
