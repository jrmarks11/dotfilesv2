local M = {}

function M.frecency_list(rw)
  local weight = rw or 0.5
  local visits = require 'mini.visits'
  local sort_recent = visits.gen_sort.default { recency_weight = weight }
  local recent_files = visits.list_paths(vim.fn.getcwd(), { sort = sort_recent })
  local current_file = vim.fn.expand '%:p'

  recent_files = vim.tbl_filter(function(file)
    return file ~= current_file
  end, recent_files)

  recent_files = vim.tbl_map(function(file)
    return vim.fn.fnamemodify(file, ':.')
  end, recent_files)

  local opts = require('fzf-lua.config').normalize_opts({ prompt = 'Recent Files> ' }, 'files')
  require('fzf-lua.core').fzf_exec(recent_files, opts)
end

return M
