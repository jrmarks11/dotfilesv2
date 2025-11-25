local map = vim.keymap.set

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<M-BS>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')

map('n', 'sp', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Substitute in Paragraph' })
map('x', 'sp', [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = 'Substitute in Paragraph' })
map('n', 'se', [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = 'Substitute In Entire Buffer' })
map('x', 'se', 'y:%s/<c-r><c-0>//g<left><left>', { desc = 'Substitute In Entire Buffer' })

map('n', 'gp', 'mz<cmd>put<CR>`zj<cmd>delmarks z<cr>', { desc = 'Paste on next line' })
map('n', 'gP', 'mz<cmd>put!<CR>`zk<cmd>delmarks z<cr>', { desc = 'Paste on previous line' })
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

map('n', '<space>y', function()
  vim.fn.setreg('+', '@' .. vim.fn.expand '%:p')
end, { desc = 'Yank @file for Claude' })

map('x', '<space>y', function()
  local path = vim.fn.expand '%:p'
  local start_line = vim.fn.line 'v'
  local end_line = vim.fn.line '.'
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  vim.fn.setreg('+', '@' .. path .. ':' .. start_line .. '-' .. end_line)
end, { desc = 'Yank @file:lines for Claude' })
