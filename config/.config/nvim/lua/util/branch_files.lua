local M = {}

function M.branch_files()
  require('fzf-lua').git_files {
    cmd = 'git diff --name-only master',
    prompt = 'BranchFiles❯ ',
    previewer = 'custom',
    preview = {
      type = 'cmd',
      fn = function(items)
        local file = require('fzf-lua').path.entry_to_file(items[1])
        return string.format(
          'cd $(git rev-parse --show-toplevel) && git diff --color=always master -- %s | delta',
          file.path
        )
      end,
    },
  }
end

return M
