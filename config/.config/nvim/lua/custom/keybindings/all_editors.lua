local map = vim.keymap.set
local cmd = vim.cmd

map({ 'n', 'x' }, 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
map({ 'n', 'x' }, 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })

map('v', 'J', [[:m '>+1<CR>gv=gv]])
map('v', 'K', [[:m '<-2<CR>gv=gv]])

map('n', 'J', 'mzJ`z')
map('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', { silent = true })

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

map({ 'n', 'x' }, [[']], '`', { remap = true })
map({ 'n', 'x' }, ';', ':')

map('n', '[<leader>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Empty lines above' })
map('n', ']<leader>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', { silent = true, desc = 'Empty lines below' })

map('n', '<leader><Tab>', '<C-^>', { desc = 'Switch to Last buffer' })

map({ 'n', 'x', 'v' }, 's', '<nop>', { remap = true })
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

