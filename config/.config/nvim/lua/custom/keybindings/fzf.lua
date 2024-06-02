local m = vim.keymap.set

local function map(mode, key, command, description)
  m(mode, key, command, { silent = true, desc = description })
end

map('n', '<leader>B', [[<cmd>lua require('fzf-lua').buffers()<CR>]], 'Fzf [B]uffers')
map('n', '<leader>D', [[<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>]], 'Fzf Files CW[D]')
map('n', '<leader>F', [[<cmd>lua require('fzf-lua').grep_cword()<CR>]], 'Fzf [F]ind Word')
map('x', '<leader>F', [[<cmd>lua require('fzf-lua').grep_visual()<CR>]], 'Fzf [F]ind Visual')
map('n', '<leader>G', [[<cmd>lua require('fzf-lua').git_status()<CR>]], 'Fzf [G]it Status')
map('n', '<leader>H', [[<cmd>lua require('fzf-lua').help_tags()<CR>]], 'Fzf [H]elp')
map('n', '<leader>J', [[<cmd>lua require('fzf-lua').grep()<CR>]], 'Fzf Grep Pro[j]ect')
map('n', '<leader>N', [[<cmd>lua require('util.branch_files').branch_files()<cr>]], 'Fzf Files in Bra[n]ch')
map('n', '<leader>R', [[<cmd>lua require('fzf-lua').oldfiles({cwd_only = true})<CR>]], 'Fzf Histo[r]y')
map('n', '<leader>T', [[<cmd>lua require('fzf-lua').files()<CR>]], 'Fzf [T]o Files')
map('n', '<leader>U', [[<cmd>lua require('fzf-lua').resume()<CR>]], 'Fzf Res[u]me')
