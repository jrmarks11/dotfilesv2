local map = vim.keymap.set

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

map('n', '[q', '<Plug>(qf_qf_previous)')
map('n', ']q', '<Plug>(qf_qf_next)')
map('n', ',q', '<Plug>(qf_qf_toggle_stay)')
map('n', '[l', '<Plug>(qf_loc_previous)')
map('n', ']l', '<Plug>(qf_loc_next)')
map('n', ',l', '<Plug>(qf_loc_toggle_stay)')
