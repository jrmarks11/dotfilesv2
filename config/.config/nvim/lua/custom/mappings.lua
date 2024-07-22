local cmd = vim.cmd
local d = vim.diagnostic
local map = vim.keymap.set

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<esc><bs>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')
map('c', '..', [[getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '..']], { expr = true })

map('n', '[d', d.goto_prev, { desc = 'Go To Previous [D]iagnostic' })
map('n', ']d', d.goto_next, { desc = 'Go To Next [D]iagnostic' })
map('n', 'sp', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]], { desc = '[S]ubstitute in [P]aragraph' })
map('x', 'sp', [[y:'{,'}s/<c-r><c-0>//g<left><left>]], { desc = '[S]ubstitute in [P]aragraph' })
map('n', '<space>e', ':e <cfile><CR>', { desc = '[E]dit File Under Cursor' })
map('n', '<space>l', ':Lazy<CR>', { desc = 'Open [L]azy' })
map('n', 'se', [[:%s/\<<c-r><c-w>\>//g<left><left>]], { desc = '[S]ubstitute In [E]ntire Buffer' })
map('x', 'se', 'y:%s/<c-r><c-0>//g<left><left>', { desc = '[S]ubstitute In [E]ntire Buffer' })
map('n', ',r', [[<cmd>lua require('util.rename_file').rename_file()<CR>]], { desc = '[R]ename File' })
map('n', 'gp', 'mz<cmd>put<CR>`zj', { desc = '[G]o [P]aste' })

map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])
map({ 'n', 'x' }, ',', '<nop>')
map({ 'n', 'x' }, 's', '<nop>')

map('n', 'J', 'mzJ`z')
map('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', { silent = true })

map({ 'n', 'x' }, [[']], '`', { remap = true })
map({ 'n', 'x' }, ';', ':')

map('n', '[<space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Empty lines above' })
map('n', ']<space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Empty lines below' })

map('n', '<space><Tab>', '<C-^>', { desc = 'Switch to Last buffer' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('x', 'ae', 'gg0oG$', { silent = true, desc = 'Select [A]n [E]ntire File' })
map('o', 'ae', function()
  cmd 'execute "normal! m`"'
  cmd 'keepjumps normal! ggVG'
end, { silent = true, desc = 'Select [A]n [E]ntire File' })

map('x', 'il', '<esc>^vg_', { silent = true, desc = 'Select [I]nner [L]ine' })
map('o', 'il', function()
  cmd 'execute "normal! m`"'
  cmd 'keepjumps normal! ^vg_'
end, { silent = true, desc = 'Select [I]nner [L]ine' })
