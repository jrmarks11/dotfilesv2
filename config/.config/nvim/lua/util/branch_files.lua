print("branch_files.lua loaded")

local M = {}

function M.branch_files()
  require('fzf-lua').git_files({
    prompt = 'BranchFiles❯ ',
    cmd = 'git diff --name-only master',
    previewer = "builtin",
  })
end

return M
