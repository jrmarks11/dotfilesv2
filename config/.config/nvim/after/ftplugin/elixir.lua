local map = vim.keymap.set
local opt = vim.opt

map('n', ',f', '<cmd>TestFile --trace<cr>', { desc = 'Test[F]ile --trace' })
map('n', ',g', [[<cmd>lua require('util.elixir').run_debug_test()<CR>]], { desc = 'TestNearest with Debu[g]ger' })
map('n', ',k', '<cmd>TestLast --trace<cr>', { desc = 'TestLast --trace' })
map('n', ',p', 'Orequire IEx; IEx.pry()<Esc>', { desc = 'Insert IEx.[p]ry()' })
map('n', ',t', '<cmd>TestNearest --trace<cr>', { desc = '[T]estNearest --trace' })
map('n', ',y', ':g/^\\W*require IEx.*IEx.pry()$/d<CR>', { desc = 'Remove IEx.pr[y]()' })

opt.colorcolumn = { 121, 122 }
opt.textwidth = 120
