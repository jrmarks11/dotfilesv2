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

  local all_files = vim.fn.systemlist 'fd --type f --hidden --exclude .git'

  all_files = vim.tbl_filter(function(file)
    return vim.fn.fnamemodify(file, ':p') ~= current_file
  end, all_files)

  local file_list = vim.list_extend(recent_files, all_files)

  file_list = vim.tbl_filter(function(file)
    return not file:match '%.local/share/nvim/scratch'
  end, file_list)

  local seen = {}
  file_list = vim.tbl_filter(function(file)
    if seen[file] then
      return false
    end
    seen[file] = true
    return true
  end, file_list)

  local opts = require('fzf-lua.config').normalize_opts({
    prompt = 'Frecent(' .. weight .. ')> ',
    fzf_opts = { ['--no-sort'] = '' },
  }, 'files')

  require('fzf-lua.core').fzf_exec(file_list, opts)
end

return M
