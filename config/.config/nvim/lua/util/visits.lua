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
  local recent_files = visits.list_paths(vim.fn.getcwd(), { sort = sort_recent })
  local current_file = vim.fn.expand '%:p'

  recent_files = vim.tbl_filter(function(file)
    return file ~= current_file
  end, recent_files)

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
  local visits = require 'mini.visits'
  local marked_files = visits.list_paths(vim.fn.getcwd(), { filter = 'marked' })
  local current_file = vim.fn.expand '%:p'
  local result = {}
  local current_file_pos = nil

  for i, file in ipairs(marked_files) do
    if file == current_file then
      current_file_pos = i
      table.insert(result, string.format('[%d]', i))
    else
      table.insert(result, tostring(i))
    end
  end

  local status = table.concat(result, ' ')
  if current_file_pos then
    return status, 'MiniStatuslineMarked'
  else
    return status, 'MiniStatuslineUnmarked'
  end
end

function M.marked_files_picker()
  local visits = require 'mini.visits'
  local marked_files = visits.list_paths(vim.fn.getcwd(), { filter = 'marked' })

  require('fzf-lua').fzf_exec(marked_files, {
    prompt = 'Marked Files> ',
    previewer = 'builtin',
    actions = {
      ['default'] = function(selected)
        vim.cmd('edit ' .. selected[1])
      end,
      ['ctrl-x'] = function(selected)
        local file = selected[1]
        local cwd = vim.fn.getcwd()
        visits.remove_label('marked', file, cwd)
        M.marked_files_picker() -- Reload the picker to reflect changes
      end,
    },
  })
end

return M
