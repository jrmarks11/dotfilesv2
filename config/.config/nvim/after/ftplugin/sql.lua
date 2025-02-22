local map = vim.keymap.set

map({ 'n', 'v' }, '<space>q<cr>', '<Plug>(DBUI_ExecuteQuery)')
map('n', '<space>qw', '<Plug>(DBUI_SaveQuery)')
