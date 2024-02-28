local map = vim.keymap.set

map('n', "'", '`')
map('x', "'", '`')
map('n', ';', ':')
map('x', ';', ':')

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
