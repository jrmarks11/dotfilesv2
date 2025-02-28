local M = {}

function M.snacks_branch_files()
  Snacks.picker.pick({
    finder = function()
      local output = vim.fn.systemlist("git diff --name-only master --relative")
      local items = {}
      for _, file in ipairs(output) do
        table.insert(items, { text = file, file = file })
      end
      return items
    end,
  })
end

return M
