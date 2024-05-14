local map = vim.keymap.set

map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<esc><bs>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')

map('c', '..', [[getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '..']], { expr = true })

map('n', '<Space><Space>', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Replace in paragraph' })
map('x', '<Space><Space>', [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = 'Replace in paragraph' })
map('n', '<Space>e', [[:e <cfile><CR>]], { desc = 'Edit file under cursor' })
map('n', '<Space>l', [[:Lazy<CR>]], { desc = 'Open Lazy' })
map('n', '<Space>s', [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Replace in buffer' })
map('x', '<Space>s', [[y:%s/<c-r><c-0>//g<left><left>]], { desc = 'Replace in buffer' })

map('n', ',r', [[<cmd>lua require('util.rename_file').rename_file()<CR>]], { desc = 'Rename file' })
map('n', 'gx', [[<cmd>lua require('util.web').open()<CR>]], { desc = 'Open URL under cursor' })
