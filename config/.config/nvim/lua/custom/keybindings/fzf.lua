local m = vim.keymap.set

local function map(mode, key, command, description)
  m(mode, key, command, { silent = true, desc = description })
end

map('n', '<space>b', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], 'Branch Files')
map('n', '<space>d', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], 'Directory Files')
map('n', '<space>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], 'Search Find Word')
map('x', '<space>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], 'Search Find Visual')
map('n', '<space>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], 'Git Status')
map('n', '<space>h', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], 'Search Help Docs')
map('n', '<space>j', [[<cmd>lua require('fzf-lua').grep()<CR>]], 'Search Grep Project')
map('n', '<space>t', [[<cmd>lua require('fzf-lua').files()<CR>]], 'To Files')
map('n', '<space>u', [[<cmd>lua require('fzf-lua').resume()<CR>]], 'Resume Fzf Search')
