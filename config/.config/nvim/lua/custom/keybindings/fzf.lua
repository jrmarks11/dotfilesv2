local m = vim.keymap.set

local function map(mode, key, command, description)
  m(mode, key, command, { silent = true, desc = description })
end

map('n', '<space>b', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], '[B]ranch Files')
map('n', '<space>d', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], '[D]irectory Files')
map('n', '<space>f', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], 'Search [F]ind Word')
map('x', '<space>f', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], 'Search [F]ind Visual')
map('n', '<space>g', [[<cmd>lua require('fzf-lua').git_status()<CR>]], '[G] git Status')
map('n', '<space>h', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], 'Search [H]elp Docs')
map('n', '<space>j', [[<cmd>lua require('fzf-lua').grep()<CR>]], 'Search Grep Pro[j]ect')
map('n', '<space>t', [[<cmd>lua require('fzf-lua').files()<CR>]], '[T]o Files')
map('n', '<space>u', [[<cmd>lua require('fzf-lua').resume()<CR>]], 'Res[u]me Fzf Search')
