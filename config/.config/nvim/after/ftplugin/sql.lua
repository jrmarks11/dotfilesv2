local map = vim.keymap.set

map({ 'n', 'v' }, 's<cr>', '<Plug>(DBUI_ExecuteQuery)')
map('n', 'sw', '<Plug>(DBUI_SaveQuery)')
