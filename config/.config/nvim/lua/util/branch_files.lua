local M = {}

function M.branch_files()
  local cwd = vim.fn.getcwd()
  local fzf_lua = require 'fzf-lua'

  fzf_lua.git_files {
    cmd = 'git diff --name-only master -- ' .. cwd,
    prompt = 'BranchFiles❯ ',
    cwd = cwd,
    previewer = false,
    preview = {
      type = 'cmd',
      fn = function(items)
        local file = fzf_lua.path.entry_to_file(items[1])
        return string.format(
          'cd $(git rev-parse --show-toplevel) && git diff --color=always master -- %s | delta',
          file.path
        )
      end,
    },
    actions = {
      ['default'] = function(selected)
        local file = fzf_lua.path.entry_to_file(selected[1])
        local git_root = fzf_lua.path.git_root()
        local relative_path = cwd:gsub('^' .. vim.pesc(git_root) .. '/', '')
        local edit_path = file.path:gsub('^' .. vim.pesc(relative_path) .. '/', '')

        vim.cmd('edit ' .. edit_path)
      end,
    },
  }
end

return M
