local d = vim.diagnostic
local map = vim.keymap.set

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<M-BS>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')

map('n', '[d', d.goto_prev, { desc = 'Go To Previous Diagnostic' })
map('n', ']d', d.goto_next, { desc = 'Go To Next Diagnostic' })

map('n', 'sp', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Substitute in Paragraph' })
map('x', 'sp', [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = 'Substitute in Paragraph' })
map('n', 'se', [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Substitute In Entire Buffer' })
map('x', 'se', 'y:%s/<c-r><c-0>//g<left><left>', { desc = 'Substitute In Entire Buffer' })

map('n', 'gp', 'mz<cmd>put<CR>`zj<cmd>delmarks z<cr>', { desc = 'Paste on next line' })
map('n', 'gP', 'mz<cmd>put!<CR>`zk<cmd>delmarks z<cr>', { desc = 'Paste on previous line' })
map('n', 'gh', '_', { desc = 'Go to beginning of line' })
map('n', 'gl', '$', { desc = 'Go to end of the line' })
map('n', 'gm', 'gM', { desc = 'Go to middle of line' })
map('n', 'gF', ':e <cfile><CR>', { desc = 'Edit File Under Cursor' })

map('n', '<space>l', ':Lazy<CR>', { desc = 'Open lazy' })

map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

map({ 'n', 'x' }, ',', '<nop>')
map({ 'n', 'x' }, 's', '<nop>')

map('n', 'J', 'mzJ`z<cmd>delmarks z<cr>', { silent = true })
map('n', 'K', 'i<cr><esc>^mzgk:silent! s/\\v +$//<cr>:noh<cr>`z:delmarks z<cr>', { silent = true })

map({ 'n', 'x' }, [[']], '`', { remap = true })
map({ 'n', 'x' }, ';', ':')

map({ 'n', 'x' }, '<space><Tab>', '<C-^>', { desc = 'Go to Last buffer' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', 'gy', "'[V']'")

map('n', '<space>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%')
end, { desc = 'Yank file name to clipboard' })

map('n', '<space>yp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
end, { desc = 'Yank full file path to clipboard' })
