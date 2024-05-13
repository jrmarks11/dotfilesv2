local M = {}

function M.branch_files()
  require 'fzf-lua'.fzf_exec(
    "git diff --name-only master", {
      fzf_opts = {
        ['--preview'] = "cd $(git rev-parse --show-toplevel) && git diff --color=always master -- {}",
      },
    })
end

return M
