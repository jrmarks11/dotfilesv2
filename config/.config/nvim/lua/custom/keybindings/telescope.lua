local telescope = require('telescope')
local map = vim.keymap.set
local builtin = require('telescope.builtin')

map('n', '<Space>d', function() builtin.find_files({ cwd = '%:h' }) end, { desc = 'Find files in current directory' })
map('n', '<Space>g', builtin.git_status, { desc = 'Git status files' })
map('n', '<Space>r', function() telescope.extensions.recent_files.pick() end, { desc = 'Recent files' })
map('n', '<Space>t', builtin.find_files, { desc = 'Find files' })
map('n', '<Space>m', builtin.marks, { desc = 'Marks' })

map('n', '<Space>f', function()
  local word = vim.fn.expand('<cword>')
  builtin.grep_string({ search = word })
end, { desc = 'Grep word under cursor' })

map('x', '<Space>f', function()
  vim.cmd('normal! y')
  local visual_text = vim.fn.getreg('')
  builtin.grep_string({ search = visual_text })
end, { desc = 'Grep visual selection' })

map('n', '<Space>h', function()
  local word = vim.fn.expand('<cword>')
  builtin.help_tags({ default_text = word })
end, { desc = 'Help tags' })

map('n', '<Space>j', function()
  builtin.grep_string({ search = vim.fn.input('grep ❯ ') })
end, { desc = 'Grep' })
