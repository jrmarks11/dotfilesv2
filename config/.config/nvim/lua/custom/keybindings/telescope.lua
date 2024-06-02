local telescope = require('telescope')
local map = vim.keymap.set
local builtin = require('telescope.builtin')

map('n', '<Space>B', builtin.buffers, { desc = 'Buffers' })
map('n', '<Space>D', function() builtin.find_files({ cwd = '%:h' }) end, { desc = 'Find files in current directory' })
map('n', '<Space>G', builtin.git_status, { desc = 'Git status files' })
map('n', '<Space>R', function() telescope.extensions.recent_files.pick() end, { desc = 'Recent files' })
map('n', '<Space>T', builtin.find_files, { desc = 'Find files' })

map('n', '<Space>F', function()
  local word = vim.fn.expand('<cword>')
  builtin.grep_string({ search = word })
end, { desc = 'Grep word under cursor' })

map('x', '<Space>F', function()
  vim.cmd('normal! y')
  local visual_text = vim.fn.getreg('')
  builtin.grep_string({ search = visual_text })
end, { desc = 'Grep visual selection' })

map('n', '<Space>H',  builtin.help_tags, { desc = 'Help tags' })

map('n', '<Space>J', function()
  builtin.grep_string({ search = vim.fn.input('grep ❯ ') })
end, { desc = 'Grep' })
