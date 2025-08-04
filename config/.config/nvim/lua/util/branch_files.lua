local M = {}

function M.branch_files()
  local root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  local fzf_lua = require 'fzf-lua'
  local actions = require 'fzf-lua.actions'

  fzf_lua.fzf_exec('git diff --name-only master --relative', {
    prompt = 'BranchFiles❯ ',
    cwd = root,
    fzf_opts = { ['--multi'] = '' },
    preview = {
      type = 'cmd',
      fn = function(items)
        local file = fzf_lua.path.entry_to_file(items[1])
        return string.format('cd %s && git diff --color=always master -- %s', root, file.path)
      end,
    },
    actions = {
      ['default'] = actions.file_edit_or_qf,
    },
  })
end

function M.snacks_branch_files()
  Snacks.picker.pick {
    finder = function()
      local output = vim.fn.systemlist 'git diff --name-only master --relative'
      local items = {}
      for _, file in ipairs(output) do
        table.insert(items, { text = file, file = file })
      end
      return items
    end,
  }
end

return M
