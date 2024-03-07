local map = vim.keymap.set
local opt = vim.opt

map('n', ',g', '<cmd>lua require("util.elixir").run_debug_test()<CR>')
map('n', ',f', '<cmd>TestFile --trace<cr>')
map('n', ',i', '"zyawoIO.inspect(<C-r>z)<Esc>')
map('n', ',p', 'Orequire IEx; IEx.pry()<Esc>')
map('n', ',y', ':g/^\\W*require IEx.*IEx.pry()$/d<CR>')

opt.colorcolumn = { 101, 102 }
opt.textwidth = 100
