local m = vim.keymap.set

local function map(mode, key, command, description)
  m(mode, key, command, { silent = true, desc = description })
end

map('n', '<leader>b', [[<cmd>lua require('fzf-lua').buffers()<CR>]], 'Fzf Buffers')
map('n', '<leader>c', [[<cmd>lua require('util.colorscheme').picker()<CR>]], 'Change colorscheme')
map('n', '<leader>d', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], 'Fzf Files CWD')
map('n', '<leader>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], 'Fzf Grep Word')
map('x', '<leader>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], 'Fzf Grep Visual')
map('n', '<leader>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], 'Fzf Git Stautus')
map('n', '<leader>h', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], 'Fzf Help Tags')
map('n', '<leader>j', [[<cmd>lua require('fzf-lua').grep()<CR>]], 'Fzf Grep Project')
map('n', '<leader>n', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], 'Fzf Files in branch')
map('n', '<leader>r', [[<cmd>lua require('fzf-lua').oldfiles({cwd_only = true})<CR>]], 'Fzf Oldfiles')
map('n', '<leader>t', [[<cmd>lua require('fzf-lua').files()<CR>]], 'Fzf Files')
