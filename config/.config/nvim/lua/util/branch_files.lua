local M = {}

function M.branch_files()
  local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local fzf_lua = require 'fzf-lua'
  local actions = require 'fzf-lua.actions'

  fzf_lua.files {
    cmd = 'git diff --name-only master',
    prompt = 'BranchFiles❯ ',
    cwd = root,
    previewer = false,
    preview = {
      type = 'cmd',
      fn = function(items)
        local file = fzf_lua.path.entry_to_file(items[1])
        return string.format('cd %s && git diff --color=always master -- %s | delta', root, file.path)
      end,
    },
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  }
end

return M
