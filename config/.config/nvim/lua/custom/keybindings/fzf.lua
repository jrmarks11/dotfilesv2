local map = vim.keymap.set
map("n", "<space>b", "<cmd>lua require('fzf-lua').buffers()<CR>",
  { silent = true, desc = "Fzf Buffers", })

map("n", "<space>d", "<cmd>lua require('fzf-lua').files({cwd = '%:h'})<CR>",
  { silent = true, desc = "Fzf Files CWD" })

map("n", "<space>g", "<cmd>lua require('fzf-lua').git_status()<CR>",
  { silent = true, desc = "Fzf Git Stautus" })

map("n", "<space>r", "<cmd>lua require('fzf-lua').oldfiles({cwd_only = true})<CR>",
  { silent = true, desc = "Fzf Oldfiles" })

map("n", "<space>t", "<cmd>lua require('fzf-lua').files()<CR>",
  { silent = true, desc = "Fzf Files" })

map('n', '<space>n', [[<cmd>lua require('util.branch_files').branch_files()<cr>]],
  { desc = 'Fzf Files in branch' })

map("n", "<space>f", "<cmd>lua require('fzf-lua').grep_cword()<CR>",
  { silent = true, desc = "Fzf Grep Word" })

map("x", "<space>f", "<cmd>lua require('fzf-lua').grep_visual()<CR>",
  { silent = true, desc = "Fzf Grep Visual" })

map("n", "<space>h", "<cmd>lua require('fzf-lua').help_tags()<CR>",
  { silent = true, desc = "Fzf Help Tags" })

map("n", "<space>j", "<cmd>lua require('fzf-lua').grep()<CR>",
  { silent = true, desc = "Fzf Grep Project" })
