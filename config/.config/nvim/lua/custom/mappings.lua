local map = vim.keymap.set
local cmd = vim.cmd

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map('n', "'", '`')
map('x', "'", '`')
map('n', ';', ':')
map('x', ';', ':')
map('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', { silent = true })

map('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', { silent = true })
map('n', ']<Space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', { silent = true })
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

map('n', '<Space><Tab>', '<C-^>')
map('n', '<Space>p', '<cmd>lua require("util.no_paste").paste()<CR>', { silent = true })

map('x', 'ae', 'gg0oG$', { silent = true })

map('o', 'ae', function()
  cmd('execute "normal! m`"')
  cmd('keepjumps normal! ggVG')
end, { silent = true })

map('n', '<Space><Space>', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space><Space>', [[y:'{,'}s/<c-r><c-0>//g<left><left>]])
map('n', '<Space>s', [[:%s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space>s', [[y:%s/<c-r><c-0>//g<left><left>]])

map('n', 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], { expr = true })
map('n', 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], { expr = true })
map('x', 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], { expr = true })
map('x', 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], { expr = true })

map('n', 'Q', '@q')
map('x', 'Q', [[:'<,'>normal @q<cr>]])
map('x', '.', [[:normal .<cr>]])

map('n', 's', "<nop>", { remap = true })
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

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
