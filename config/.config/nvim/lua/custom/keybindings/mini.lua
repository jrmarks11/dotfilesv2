local map = vim.keymap.set

map('n', '<leader>m', '<Cmd>lua MiniVisits.select_path(nil, { filter = "marked" })<CR>', { desc = '[M]arked Files' })
map('n', '<leader><leader>', '<Cmd>lua require("util.visits").toggle_marked()<CR>', { desc = 'Toggle Marked' })

local map_iterate_marks = function(lhs, direction, desc)
  local opts = { filter = 'marked', wrap = true }
  local rhs = function()
    require('mini.visits').iterate_paths(direction, vim.fn.getcwd(), opts)
  end
  map('n', lhs, rhs, { desc = desc })
end

map_iterate_marks('<leader>n', 'forward', '[N]ext Marked Label')
map_iterate_marks('<leader>p', 'backward', '[P]revious Marked Label')
