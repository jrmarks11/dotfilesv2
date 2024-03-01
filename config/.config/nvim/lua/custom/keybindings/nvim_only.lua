local map = vim.keymap.set
local cmd = vim.cmd

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<esc><bs>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')

map('c', '..', "getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '..'", { expr = true })

map('n', '<Space><Space>', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space><Space>', [[y:'{,'}s/<c-r><c-0>//g<left><left>]])
map('n', '<Space>s', [[:%s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space>s', [[y:%s/<c-r><c-0>//g<left><left>]])

map('n', ',r', '<cmd>lua require("util.rename_file").rename_file()<CR>')

local qf = require('util.qf')

map('n', ']l', function()
  qf.safe_next('l')
  cmd('normal! zz')
end)

map('n', '[l', function()
  qf.safe_prev('l')
  cmd('normal! zz')
end)

map('n', ',l', function() qf.toggle_list('l') end)

map('n', '[q', function()
  qf.safe_prev('c')
  cmd('normal! zz')
end)

map('n', ']q', function()
  qf.safe_next('c')
  cmd('normal! zz')
end)

map('n', ',q', function() qf.toggle_list('c') end)
