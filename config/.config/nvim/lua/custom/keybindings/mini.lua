local map = vim.keymap.set

map('n', '<space>M', '<Cmd>lua require("util.visits").marked_files_picker()<CR>', { desc = 'Marked Files' })
map('n', '<space>m', '<Cmd>lua require("util.visits").toggle_marked()<CR>', { desc = 'Toggle Marked' })

local map_iterate_marks = function(lhs, direction, desc)
  local opts = { filter = 'marked', wrap = true }
  local rhs = function()
    require('mini.visits').iterate_paths(direction, vim.fn.getcwd(), opts)
  end
  map('n', lhs, rhs, { desc = desc })
end

map_iterate_marks('<space>n', 'forward', 'Next Marked Label buffer')
map_iterate_marks('<space>p', 'backward', 'Previous Marked Label buffer')

map('n', '<space>r', '<Cmd>lua require("util.visits").frecency_list()<CR>', { desc = 'Recent Files' })

map('n', 'ss', '<Cmd>lua require("mini.splitjoin").toggle()<CR>', { desc = 'SplitJoin Toggle' })
