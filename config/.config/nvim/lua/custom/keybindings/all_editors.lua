local map = vim.keymap.set
local cmd = vim.cmd

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', 'J', 'mzJ`z')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map({ 'n', 'x' }, "'", '`')
map({ 'n', 'x' }, ';', ':')

map('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', { silent = true })

map('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', { silent = true })
map('n', ']<Space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', { silent = true })

map('n', '<Space>p', '<cmd>lua require("util.no_paste").paste()<CR>', { silent = true })
map('n', '<Space><Tab>', '<C-^>')

map('x', 'ae', 'gg0oG$', { silent = true })
map('o', 'ae', function()
  cmd('execute "normal! m`"')
  cmd('keepjumps normal! ggVG')
end, { silent = true })

map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', 'Q', '@q')
map('x', 'Q', [[:'<,'>normal @q<cr>]])
map('x', '.', [[:normal .<cr>]])

map('n', 's', '<nop>', { remap = true })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
