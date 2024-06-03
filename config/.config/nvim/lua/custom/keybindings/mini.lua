local map = vim.keymap.set

local map_vis = function(keys, call, desc)
  local rhs = '<Cmd>lua MiniVisits.' .. call .. '<CR>'
  map('n', '<Leader>' .. keys, rhs, { desc = desc })
end

map_vis('m', 'select_path(nil, { filter = "marked" })', '[M]arked Files')
map('n', '<leader><leader>', '<Cmd>lua require("util.visits").toggle_marked()<CR>', { desc = 'Toggle Marked' })

local map_iterate_core = function(lhs, direction, desc)
  local opts = { filter = 'marked', wrap = true }
  local rhs = function()
    MiniVisits.iterate_paths(direction, vim.fn.getcwd(), opts)
  end
  map('n', lhs, rhs, { desc = desc })
end

map_iterate_core('<leader>n', 'forward', '[N]ext Marked Label')
map_iterate_core('<leader>p', 'backward', '[P]revious Marked Label')
