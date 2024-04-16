local telescope = require('telescope')
local map = vim.keymap.set
local builtin = require('telescope.builtin')

map('n', '<Space>d', function() builtin.find_files({ cwd = '%:h' }) end)
map('n', '<Space>g', builtin.git_status)
map('n', '<Space>r', function() telescope.extensions.recent_files.pick() end)
map('n', '<Space>t', builtin.find_files)
map('n', '<Space>m', builtin.marks)

map('n', '<Space>f', function()
  local word = vim.fn.expand('<cword>')
  builtin.grep_string({ search = word })
end)

map('x', '<Space>f', function()
  vim.cmd('normal! y')
  local visual_text = vim.fn.getreg('')
  builtin.grep_string({ search = visual_text })
end)

map('n', '<Space>h', function()
  local word = vim.fn.expand('<cword>')
  builtin.help_tags({ default_text = word })
end)

map('n', '<Space>j', function()
  builtin.grep_string({ search = vim.fn.input('grep ❯ ') })
end)
