local map = vim.keymap.set
local opt = vim.opt

map('n', ',f', '<cmd>TestFile --trace<cr>', { desc = 'TestFile --trace' })
map('n', ',g', [[<cmd>lua require('util.elixir').run_debug_test()<CR>]], { desc = 'TestNearest with debugger' })
map('n', ',w', [[<cmd>lua require('util.elixir').run_watch_test()<CR>]], { desc = 'TestFile --trace with watch' })
map('n', ',k', '<cmd>TestLast --trace<cr>', { desc = 'TestLast --trace' })
map('n', ',p', 'Orequire IEx; IEx.pry()<Esc>', { desc = 'Insert IEx.pry()' })
map('n', ',t', '<cmd>TestNearest --trace<cr>', { desc = 'TestNearest --trace' })
map('n', ',y', ':g/^\\W*require IEx.*IEx.pry()$/d<CR>', { desc = 'Remove IEx.pry()' })

opt.colorcolumn = { 101, 102 }
opt.textwidth = 100
