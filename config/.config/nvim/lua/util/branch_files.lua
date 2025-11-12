local M = {}

function M.snacks_branch_files()
  Snacks.picker.pick {
    finder = function()
      local output = vim.fn.systemlist 'git diff --name-only origin/master --relative'
      local items = {}
      for _, file in ipairs(output) do
        local diff_output = vim.fn.system('git diff origin/master -- ' .. vim.fn.shellescape(file))
        table.insert(items, {
          text = file,
          file = file,
          diff = diff_output,
        })
      end
      return items
    end,
    format = "git_status",
    preview = "diff",
  }
end

return M
