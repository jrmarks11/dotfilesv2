local map = vim.keymap.set
map('n', '<leader>b', [[<cmd>lua require('fzf-lua').buffers()<CR>]], { silent = true, desc = 'Fzf Buffers' })

map('n', '<leader>d', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], { silent = true, desc = 'Fzf Files CWD' })

map('n', '<leader>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], { silent = true, desc = 'Fzf Git Stautus' })

map('n', '<leader>r', [[<cmd>lua require('fzf-lua').oldfiles({cwd_only = true})<CR>]], { silent = true, desc = 'Fzf Oldfiles' })

map('n', '<leader>t', [[<cmd>lua require('fzf-lua').files()<CR>]], { silent = true, desc = 'Fzf Files' })

map('n', '<leader>n', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], { desc = 'Fzf Files in branch' })

map('n', '<leader>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], { silent = true, desc = 'Fzf Grep Word' })

map('x', '<leader>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], { silent = true, desc = 'Fzf Grep Visual' })

map('n', '<leader>h', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], { silent = true, desc = 'Fzf Help Tags' })

map('n', '<leader>j', [[<cmd>lua require('fzf-lua').grep()<CR>]], { silent = true, desc = 'Fzf Grep Project' })

map('n', '<leader>c', [[<cmd>lua require('util.colorscheme').picker()<CR>]], { desc = 'Change colorscheme' })
