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

map('n', '<leader><leader>', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Replace in paragraph' })
map('x', '<leader><leader>', [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = 'Replace in paragraph' })
map('n', '<leader>e', [[:e <cfile><CR>]], { desc = 'Edit file under cursor' })
map('n', '<leader>l', [[:Lazy<CR>]], { desc = 'Open Lazy' })
map('n', '<leader>s', [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Replace in buffer' })
map('x', '<leader>s', [[y:%s/<c-r><c-0>//g<left><left>]], { desc = 'Replace in buffer' })

map('n', ',r', [[<cmd>lua require('util.rename_file').rename_file()<CR>]], { desc = 'Rename file' })
