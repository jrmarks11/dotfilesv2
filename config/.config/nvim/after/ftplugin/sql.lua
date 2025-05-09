local map = vim.keymap.set

map({ 'n', 'v' }, 's<cr>', '<Plug>(DBUI_ExecuteQuery)', { desc = 'Execute Query' })
map('n', 'sw', '<Plug>(DBUI_SaveQuery)', { desc = 'Save Query' })
