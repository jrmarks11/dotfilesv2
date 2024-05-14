local map = vim.keymap.set
local cmd = vim.cmd

map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map({ 'n', 'x' }, [[']], '`', { remap = true })
map({ 'n', 'x' }, ';', ':')

map('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', { silent = true })

map('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Insert empty lines above' })
map('n', ']<Space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Insert empty lines below' })

map('n', '<Space>p', [[<cmd>lua require('util.no_paste').paste()<CR>]], { silent = true, desc = 'Paste without paste' })

map('x', ',p', [["_dPgv=]], { desc = 'Delete int _ and Paste' })
map({ 'n', 'v' }, ',d', [["_d]], { desc = 'Delete into _ register' })

map('n', '<Space><Tab>', '<C-^>', { desc = 'Switch to alternate buffer' })

map('x', 'ae', 'gg0oG$', { silent = true, desc = 'Select entire file' })
map('o', 'ae', function()
  cmd('execute "normal! m`"')
  cmd('keepjumps normal! ggVG')
end, { silent = true, desc = 'Select entire file' })

map('x', 'il', '<esc>^vg_', { silent = true, desc = 'Select inner line' })
map('o', 'il', function()
  cmd('execute "normal! m`"')
  cmd('keepjumps normal! ^vg_')
end, { silent = true, desc = 'Select inner line' })

map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })

map('n', 'Q', '@q')
map('x', 'Q', [[:'<,'>normal @q<cr>]])
map('x', '.', [[:normal .<cr>]])

map({ 'n', 'x', 'v' }, 's', '<nop>', { remap = true, desc = 'S is a leader key' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
