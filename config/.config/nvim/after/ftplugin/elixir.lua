local map = vim.keymap.set
local opt = vim.opt

map('n', ',f', '<cmd>TestFile --trace<cr>')
map('n', ',g', '<cmd>lua require("util.elixir").run_debug_test()<CR>')
map('n', ',w', '<cmd>lua require("util.elixir").run_watch_test()<CR>')
map('n', ',k', '<cmd>TestLast --trace<cr>')
map('n', ',p', 'Orequire IEx; IEx.pry()<Esc>')
map('n', ',t', '<cmd>TestNearest --trace<cr>')
map('n', ',y', ':g/^\\W*require IEx.*IEx.pry()$/d<CR>')

opt.colorcolumn = { 101, 102 }
opt.textwidth = 100
