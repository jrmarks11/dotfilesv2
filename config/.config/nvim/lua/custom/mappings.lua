local map = vim.keymap.set

map('n', "'", '`')
map('x', "'", '`')
map('n', ';', ':')
map('x', ';', ':')

map('n', ',v', ':source $MYVIMRC<CR>')

map('n', '[<Space>', ':<C-u>put! =repeat(nr2char(10),v:count1)<CR>', {silent = true})
map('n', ']<Space>', ':<C-u>put =repeat(nr2char(10),v:count1)<CR>', {silent = true})
