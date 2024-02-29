local map = vim.keymap.set

map('n', "'", '`')
map('x', "'", '`')
map('n', ';', ':')
map('x', ';', ':')
vim.keymap.set('n', 'K', 'i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w', {silent = true})

map('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', {silent = true})
map('n', ']<Space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', {silent = true})

map('c', '<C-n>', '<down>')
map('c', '<C-p>', '<up>')
map('c', '<C-a>', '<home>')
map('c', '<C-e>', '<end>')
map('c', '<M-Left>', '<s-left>')
map('c', '<M-Right>', '<s-right>')
map('c', '<esc><bs>', '<c-w>')
map('c', '<C-k>', '<c-\\>e strpart(getcmdline(),0,getcmdpos()-1)<cr>')

map('c', '..', "getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '..'", {expr = true})

map('n', '<Space><Tab>', '<C-^>')
map('n', '<Space>p', '<cmd>lua require("util.no_paste").paste()<CR>', {silent = true})

vim.keymap.set('x', 'ae', 'gg0oG$', {silent = true})

vim.keymap.set('o', 'ae', function()
    vim.cmd('execute "normal! m`"')
    vim.cmd('keepjumps normal! ggVG')
end, {silent = true})

map('n', '<Space><Space>', [[:'{,'}s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space><Space>', [[y:'{,'}s/<c-r><c-0>//g<left><left>]])
map('n', '<Space>s', [[:%s/\<<c-r><c-w>\>//g<left><left>]])
map('x', '<Space>s', [[y:%s/<c-r><c-0>//g<left><left>]])

map('n', 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], {expr = true})
map('n', 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], {expr = true})
map('x', 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], {expr = true})
map('x', 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], {expr = true})

map('n', 'Q', '@q')
map('x', 'Q', [[:'<,'>normal @q<cr>]])
map('x', '.', [[:normal .<cr>]])

map('n', 's', "<nop>", {remap = true})
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
