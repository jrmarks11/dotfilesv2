local map = vim.keymap.set
local opt = vim.opt

map({ 'n', 'x' }, ',f', '<cmd>TestFile --trace<cr>', { desc = 'Test File --trace' })
map(
  { 'n', 'x' },
  ',g',
  [[<cmd>lua require('util.elixir').run_debug_test()<CR>]],
  { desc = 'Test Nearest with Debugger' }
)
map({ 'n', 'x' }, ',k', '<cmd>TestLast --trace<cr>', { desc = 'Test Last --trace' })
map({ 'n', 'x' }, ',p', 'Orequire IEx; IEx.pry()<Esc>', { desc = 'Insert IEx.pry()' })
map({ 'n', 'x' }, ',t', '<cmd>TestNearest --trace<cr>', { desc = 'Test Nearest --trace' })
map({ 'n', 'x' }, ',y', ':g/^\\W*require IEx.*IEx.pry()$/d<CR>', { desc = 'Remove IEx.pry()' })

opt.colorcolumn = { 121, 122 }
opt.textwidth = 120
