local m = vim.keymap.set

local function map(mode, key, command, description)
  m(mode, key, command, { silent = true, desc = description })
end

map('n', '<leader>b', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], '[B]ranch Files')
map('n', '<leader>d', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], '[D]irectory Files')
map('n', '<leader>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], '[F]ind Word')
map('x', '<leader>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], '[F]ind Visual')
map('n', '<leader>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], '[G]it Status')
map('n', '<leader>h', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], '[H]elp Docs')
map('n', '<leader>j', [[<cmd>lua require('fzf-lua').grep()<CR>]], 'Grep Pro[j]ect')
map('n', '<leader>r', [[<cmd>lua require('fzf-lua').oldfiles({cwd_only = true})<CR>]], '[R]ecent Files')
map('n', '<leader>t', [[<cmd>lua require('fzf-lua').files()<CR>]], '[T]o Files')
map('n', '<leader>u', [[<cmd>lua require('fzf-lua').resume()<CR>]], 'Res[u]me Fzf')
